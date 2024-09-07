import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/app_colors.dart';
import 'package:flutter_ecommerce_app_ui/core/utils/font_size_config.dart';

abstract class AppStyle {
  static TextStyle styleBold28(context) {
    return TextStyle(
      color: AppColors.ordinaryText,
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
      height: 0,
    );
  }

  static TextStyle styleBold14(context) {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
      height: 0,
    );
  }

  static TextStyle styleRegular11(context) {
    return TextStyle(
      color: AppColors.gray,
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }

  static TextStyle styleRegular14(context) {
    return TextStyle(
      color: AppColors.gray,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }

  static TextStyle styleMedium14(context) {
    return TextStyle(
      color: AppColors.ordinaryText,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleExtraMedium18(context) {
    return TextStyle(
      color: const Color(0xFFA8A8A9),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
      height: 0,
    );
  }

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    //fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

const TextStyle textStyle = TextStyle();
