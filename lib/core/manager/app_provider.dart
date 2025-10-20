import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String language = "en";

  void changeLanguage(String language) {
    this.language = language;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.dark;

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
