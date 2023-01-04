import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otaqu_test/bloc/blocs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';
import '../../data/data.dart';
import '../../model/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageInitial pageInitial) : super(PageInitial()) {
    on<PageEvent>((event, emit) async {
      if (event is GoToHomePage) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? bearerToken = prefs.getString(Constant.bearerToken);
        bool passBoarding = prefs.getBool(Constant.passBoarding) ?? false;
        List<DestinationModelData> list = [];
        List<String> listHistory = prefs.getStringList(Constant.listHistory) ?? [];
        List<String> listHistoryId = prefs.getStringList(Constant.listHistoryId) ?? [];
        list = await DestinationRepository().getList();

        if (bearerToken == null) {
          final bearerModel = await BearerServices.getBearerToken();
          if (bearerModel.code == 200) {
            bearerToken = bearerModel.token;
            prefs.setString(Constant.bearerToken, bearerModel.token);
          }
        }

        if (bearerToken != null) {
          if (passBoarding) {
            if (list.isEmpty) {
              final destinationModel = await DestinationServices.getDestination();

              if (destinationModel.code == 200) {
                destinationModel.datas.forEach((e) {
                  DestinationRepository().insert(e);
                });

                emit(OnHomePage(destinationModel.datas, listHistory.reversed.toList(), listHistoryId));
              } else {
                event.context.read<PageBloc>().add(GoToHomePage(event.context));
              }
            } else {
              emit(OnHomePage(list, listHistory.reversed.toList(), listHistoryId.reversed.toList()));
            }
          } else {
            if (list.isEmpty) {
              final destinationModel = await DestinationServices.getDestination();

              if (destinationModel.code == 200) {
                destinationModel.datas.forEach((e) {
                  DestinationRepository().insert(e);
                });

                emit(OnBoardingPage());
              } else {
                event.context.read<PageBloc>().add(GoToHomePage(event.context));
              }
            } else {
              emit(OnBoardingPage());
            }
          }
        } else {
          event.context.read<PageBloc>().add(GoToHomePage(event.context));
        }
      } else if (event is GoToAvailPage) {
        emit(OnAvailPage(event.name, event.packages));
      }
    });
  }
}