part of '../views.dart';

Widget buttonAll(
    {required double marginTop,
    required double marginRight,
    required double marginLeft,
    double? width,
    double? height,
    required String text,
    required bool cantSubmit,
    required Function() onPressed}
    ) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.only(top: marginTop, left: marginLeft, right: marginRight),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: MainColor.primaryBlueColor),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 12),
      ),
      onPressed:  () {
        onPressed();
  },
    ),
  );
}