import 'package:flutter/material.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:app_truyen/utils/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.gray1,
    splashColor: ColorManager.primaryOpacity70,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.gray),
    // appbar theme
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ColorManager.white,
        elevation: AppSize.s0,
        titleTextStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSizeManager.s18)),
    // text button theme
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(ColorManager.primary))),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                fontSize: FontSizeManager.s16, color: ColorManager.white),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    // text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGray, fontSize: FontSizeManager.s16),
        displayMedium: getRegularStyle(
            color: ColorManager.white, fontSize: FontSizeManager.s16),
        displaySmall: getBoldStyle(
            color: ColorManager.primary, fontSize: FontSizeManager.s18),
        titleMedium: getMediumStyle(
            color: ColorManager.lightGray, fontSize: FontSizeManager.s14),
        bodySmall: getRegularStyle(color: ColorManager.gray1),
        bodyLarge: getRegularStyle(color: ColorManager.gray)),
  );
}
