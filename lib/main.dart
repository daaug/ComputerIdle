import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medievidle',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: globalBackground,
          foregroundColor: globalFontColor,
          centerTitle: true,
        ),
        brightness: Brightness.dark,
        primaryColor: globalFontColor,
        fontFamily: "CourierPrime",
        scaffoldBackgroundColor: globalBackground,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 30.0,), // AppBar
          bodyMedium: TextStyle(fontSize: 21.0,), // Text
          labelLarge: TextStyle(fontSize: 24), // Button
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

