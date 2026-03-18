import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = "ar";

  void changeLanguage(String newlanguage) async {
    if (appLanguage == newlanguage) {
      return;
    }
    appLanguage = newlanguage;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("language", appLanguage);
  }

  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isdark", appTheme == ThemeMode.dark);
  }
}
