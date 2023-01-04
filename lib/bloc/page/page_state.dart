part of 'page_bloc.dart';

abstract class PageState {
  const PageState();
}

class PageInitial extends PageState {}

class OnHomePage extends PageState {
  List<DestinationModelData> listDestination;
  List<String> listHistory;
  List<String> listHistoryId;

  OnHomePage(this.listDestination, this.listHistory, this.listHistoryId);
}

class OnBoardingPage extends PageState {}

class OnAvailPage extends PageState {
  final String name;
  List<AvailModelPackages> packages;

  OnAvailPage(this.name, this.packages);
}