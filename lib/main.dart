import 'package:medievidle/data.dart';
import 'package:medievidle/keyboard.dart';
import 'package:flutter/material.dart';


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
        fontFamily: 'CourierPrime',
      ),
      home: const WoodcutPage(),
    );
  }
}


