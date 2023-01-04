part of 'views.dart';

class Wrapper extends StatefulWidget {

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, state) {
          if (state is OnHomePage) {
            return HomeScreen(state.listDestination, state.listHistory, state.listHistoryId);
          } else if (state is OnBoardingPage) {
            return BoardingScreen();
          } else if (state is OnAvailPage) {
            return AvailScreen(state.name, state.packages);
          } else {
            Future.delayed(Duration(seconds: 1), () {
              context.read<PageBloc>().add(GoToHomePage(context));
            });
            return SplashScreen();
          }
        }
    );
  }
}
