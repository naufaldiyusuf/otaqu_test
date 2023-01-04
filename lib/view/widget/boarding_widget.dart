part of '../views.dart';

Widget OnBoarding(String image, String title, String subtitle, BuildContext context) {
  SizeConfig().init(context);
  double sizeV = SizeConfig.blockSizeV!;
  double sizeH = SizeConfig.blockSizeH!;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          // width: sizeH * 41.748768472906406,
          //height: 41.748768472906406, //SizeConfig.pxToPercent(400),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: sizeV * 45,
                ))),
        SizedBox(
          height: sizeV * 1.6,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MainColor.neutral50),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(subtitle,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: MainColor.neutral50,
            ))
      ],
    ),
  );
}