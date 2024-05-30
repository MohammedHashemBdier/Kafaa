import 'package:flutter/material.dart';
import 'package:kafaa_app/utils/app_colors.dart';
import 'package:kafaa_app/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular24(context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.c1,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'ElMessiri',
      fontWeight: FontWeight.w700,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 800;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1800;
  }
}
