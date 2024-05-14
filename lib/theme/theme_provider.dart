import 'package:bybus/theme/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = primaryThemeData;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(int value) {
    switch (value) {
      case 1:
        themeData = primaryThemeData;
      case 2:
        themeData = deuteranopiThemeData;
      case 3:
        themeData = protanopiaThemeData;
      case 4:
        themeData = tritanopiaThemeData;
    }
  }
}
