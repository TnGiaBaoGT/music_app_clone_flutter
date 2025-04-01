
import 'package:flutter/material.dart';

class ThemeChecker{
  static bool isDarkMode(BuildContext context) {
    return
      Theme.of(context).brightness == Brightness.dark;
  }
}