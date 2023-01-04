part of 'helpers.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeH;
  static double? blockSizeV;
  static double? size8px;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeH = screenWidth! / 100;
    blockSizeV = screenHeight! / 100;
  }

  static double pxToPercent(double px) {
    return (px / _mediaQueryData!.size.height) * 100;
  }

  static double pxToPercentWidth(double px) {
    return (px / _mediaQueryData!.size.width) * 100;
  }
}