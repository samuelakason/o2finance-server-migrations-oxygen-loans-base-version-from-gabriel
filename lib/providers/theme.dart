import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool appTheme = false;
  void changeThemeColor(bool appColorTheme) {
    appTheme = appColorTheme;
    notifyListeners();
  }
}
