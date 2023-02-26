library practice.globals;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:practice/theme/main.dart';

ThemeManager themeManager = ThemeManager();

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
  primary: Colors.orange,
  brightness: Brightness.light,
));

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.cyan,
    brightness: Brightness.dark,
    background: Colors.black54,
    onBackground: Colors.white,
  ),
);
