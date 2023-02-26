import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeManager with ChangeNotifier {
  static bool _isDark = false;

  bool get isDark => _isDark;

  ThemeManager() {
    if (Hive.box("theme").containsKey('currentTheme')) {
      _isDark = Hive.box("theme").get("currentTheme");
    } else {
      Hive.box("theme").put("currentTheme", _isDark);
    }
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  toggleTheme() {
    _isDark = !_isDark;
    Hive.box("theme").put("currentTheme", _isDark);
    notifyListeners();
  }

  isDarkState() {
    return _isDark;
  }
}
