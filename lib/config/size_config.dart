import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static double topPadding = 0;
  static Orientation orientation = Orientation.landscape;
  static bool disableAnimation = false;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    topPadding=_mediaQueryData.padding.top;
    screenHeight = _mediaQueryData.size.height - _mediaQueryData.padding.top;
    orientation = _mediaQueryData.orientation;
    defaultSize = orientation == Orientation.landscape //10px
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}