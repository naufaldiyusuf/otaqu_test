part of '../views.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  var _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Widget> boarding = [
      OnBoarding("assets/logo.png", "Welcome", "Welcome to Otaqu.id mobile application, where the magic of traveling begin.", context),
      OnBoarding("assets/boarding_second.png", "Travel with easy", "In here you can see all the various destination to go for your vacation. Please have a delightful experiences in using the application.", context)
    ];

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark
      //color set to purple or set your own color
    ));
    double sizeV = SizeConfig.blockSizeV!;
    double sizeH = SizeConfig.blockSizeH!;
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return false;
          },
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 18, left: 18, top: sizeV * 2.4, bottom: sizeV * 1.6),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setBool(Constant.passBoarding, true);
                      context.read<PageBloc>().add(GoToHomePage(context));
                    },
                    child: Text(
                      "Skip",
                      style: Font.mainStylefs14fw600
                          .copyWith(color: MainColor.prmaryBlue40Color),
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.red,

                child: CarouselSlider(
                  items: boarding,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      pauseAutoPlayInFiniteScroll: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      initialPage: _current,
                      height: sizeV * 68,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: sizeV * SizeConfig.pxToPercent(41),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: boarding.asMap().entries.map((entry) {
                  return Container(
                    width: 9.0,
                    height: 9.0,
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 17.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : MainColor.primaryBlueColor)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: sizeV * 2.1,
              ),
              boarding.length == (_current + 1)
                  ? Padding(
                padding: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height / 10,
                    right: 18,
                    left: 18,
                    bottom: 0),
                child: SizedBox(
                    height: sizeV * SizeConfig.pxToPercent(48),
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: MainColor.primaryBlueColor),
                        onPressed: () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool(Constant.passBoarding, true);
                          context.read<PageBloc>().add(GoToHomePage(context));
                        },
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                              fontSize:
                              sizeV * SizeConfig.pxToPercent(14),
                              fontWeight: FontWeight.w600),
                        ))),
              )
                  : Padding(
                padding: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height / 8,
                    bottom: 0,
                    right: 18,
                    left: 18),
                child: SizedBox(
                  height: sizeV * SizeConfig.pxToPercent(48),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      onPressed: () async {
                        setState(() {
                          _current += 1;
                          _controller.animateToPage(_current);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  sizeV * SizeConfig.pxToPercent(14),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      )),
                ),
              ),
              // SizedBox(
              //   height: sizeV * 0.8,
              // ),
              // Padding(
              //     padding: EdgeInsets.only(right: 18, left: 18),
              //     child: RichText(
              //         text: TextSpan(children: [
              //           TextSpan(
              //               text:
              //               "Dengan masuk atau daftar aplikasi MaiMaid Anda setuju ",
              //               style: Font.mainStylefs11fw400.copyWith(
              //                   color: MainColor.neutral30,
              //                   fontSize: sizeV * SizeConfig.pxToPercent(11))),
              //           TextSpan(
              //               recognizer: TapGestureRecognizer()
              //                 ..onTap = () {
              //                   Navigator.push(
              //                       context,
              //                       PageTransition(
              //                           child: PageWebsite(
              //                               id: 6, tkn: ConfigGlobal.X_TKN),
              //                           type: PageTransitionType.bottomToTop));
              //                 },
              //               text: "Syarat & Ketentuan ",
              //               style: Font.mainStylefs11fw600.copyWith(
              //                   color: MainColor.prmaryBlue50Color,
              //                   fontSize: sizeV * SizeConfig.pxToPercent(11))),
              //           TextSpan(
              //               text: "dan ",
              //               style: Font.mainStylefs11fw400.copyWith(
              //                   color: MainColor.neutral30,
              //                   fontSize: sizeV * SizeConfig.pxToPercent(11))),
              //           TextSpan(
              //               recognizer: TapGestureRecognizer()
              //                 ..onTap = () {
              //                   Navigator.push(
              //                       context,
              //                       PageTransition(
              //                           child: PageWebsite(
              //                               id: 7, tkn: ConfigGlobal.X_TKN),
              //                           type: PageTransitionType.bottomToTop));
              //                 },
              //               text: "Kebijakan Privasi ",
              //               style: Font.mainStylefs11fw600.copyWith(
              //                   color: MainColor.prmaryBlue50Color,
              //                   fontSize: sizeV * SizeConfig.pxToPercent(11))),
              //           TextSpan(
              //               text: "yang berlaku.",
              //               style: Font.mainStylefs11fw400.copyWith(
              //                   color: MainColor.neutral30,
              //                   fontSize: sizeV * SizeConfig.pxToPercent(11))),
              //         ]))
              //
              //   // Text(
              //   //   "Dengan masuk atau daftar aplikasi Maimaid Anda setuju Syarat & Ketentuan yang berlaku.",
              //   //   style: Font.mainStylefs11fw400.copyWith(
              //   //       color: MainColor.neutral30,
              //   //       fontSize: sizeV * SizeConfig.pxToPercent(11)),
              //   // ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

