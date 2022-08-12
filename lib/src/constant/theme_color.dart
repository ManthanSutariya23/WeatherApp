import 'package:flutter/material.dart';
import 'package:weather/src/constant/theme.dart';

class ThemeColors {

  static void switchTheme(bool value) {
    Darktheme.theme = value;
  }

  static Color? backgroundColor() => Darktheme.theme ? Colors.black : Colors.grey[50];
  static Color? bottomBackgroundColor() => Darktheme.theme ? Colors.black : Colors.white;
  static Color? cardColor() => Darktheme.theme ? Colors.grey[900] : Colors.white;
  static Color primaryTextColor() => Darktheme.theme ? Colors.white : Colors.black87;
  static Color? secondaryTextColor() => Darktheme.theme ? Colors.grey[400] : Colors.black54;
}