import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/theme/main.dart';
import 'package:practice/utility/globals.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("theme");
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeManager())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeManager>().currentTheme(),
      title: "fucking app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Icon(
                themeManager.isDarkState() ? Icons.mode_night : Icons.sunny),
            onPressed: () => {themeManager.toggleTheme()},
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}
