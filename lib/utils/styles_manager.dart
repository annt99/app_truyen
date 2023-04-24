import 'package:flutter/material.dart';
import 'package:app_truyen/utils/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontMontserrat, color, FontWeightManager.regular);
}

TextStyle getLightStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontMontserrat, color, FontWeightManager.light);
}

TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontMontserrat, color, FontWeightManager.bold);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontMontserrat, color,
      FontWeightManager.semiBold);
}

TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontMontserrat, color, FontWeightManager.medium);
}
