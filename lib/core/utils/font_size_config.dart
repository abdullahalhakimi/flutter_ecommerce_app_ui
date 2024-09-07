import 'package:flutter/material.dart';

class SizeConfig {
  static const double desktop = 1200;
  static const double tablet = 800;
  static const double mobile = 350;

  static late double hight, width;
  static init(BuildContext context) {
    hight = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
 
  double lowerLimit = fontSize * 1;
  double upperLimit = fontSize * 1.3;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  var width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.mobile) {
    return width / 450;
  } else if (width < SizeConfig.tablet) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
