import 'package:breach_assessment/core/constants/app_colors.dart';
import 'package:breach_assessment/core/constants/app_constants.dart';
import 'package:breach_assessment/core/constants/app_strings.dart';
import 'package:breach_assessment/widgets/layout_helper.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle h1Inter(BuildContext context) => TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.grey600,
    fontSize: context.isMobile ? 28.asp : 14.asp,
  );

  static TextStyle h2Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.grey600,
    fontSize: 14.asp,
  );

  static TextStyle h3Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 16.asp,
  );

  static TextStyle h4Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 20.asp,
  );

  static TextStyle h5Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 18.asp,
  );

  static TextStyle body1RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize: 10.asp,
  );

  static TextStyle body4RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize:context.isMobile ? 16.asp : 10.asp,
  );

  static TextStyle h1Grotesk(BuildContext context) => TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.grey600,
    fontSize: context.isMobile ? 28.asp : 14.asp,
  );

  static TextStyle h2Grotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.grey600,
    fontSize: 14.asp,
  );

  static TextStyle h3Grotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 16.asp,
  );

  static TextStyle h4Grotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 20.asp,
  );

  static TextStyle h5Grotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.grey600,
    fontSize: 18.asp,
  );

  static TextStyle body1RegularGrotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2RegularGrotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3RegularGrotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize: 10.asp,
  );

  static TextStyle body4RegularGrotesk (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.groteskFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.grey600,
    fontSize:context.isMobile ? 16.asp : 10.asp,
  );
}