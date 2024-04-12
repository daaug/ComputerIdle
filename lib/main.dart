import 'package:computer_idle/data.dart';
import 'package:computer_idle/keyboard.dart';
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
      title: 'Computer Idle - The Game',
      theme: ThemeData(
        fontFamily: 'CourierPrime',
      ),
      home: const KeyboardPage(),
    );
  }
}


