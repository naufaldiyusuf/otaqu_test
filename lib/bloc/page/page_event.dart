part of 'page_bloc.dart';

abstract class PageEvent {
  const PageEvent();
}

class GoToHomePage extends PageEvent {
  BuildContext context;

  GoToHomePage(this.context);
}

class GoToBoardingPage extends PageEvent {}

class GoToSplashPage extends PageEvent {}

class GoToAvailPage extends PageEvent {
  final String name;
  final List<AvailModelPackages> packages;

  GoToAvailPage(this.name, this.packages);
}