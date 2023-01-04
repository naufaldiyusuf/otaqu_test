part of '../views.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset("assets/logo.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text(
                  "Powered by: Otaqu.id",
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
