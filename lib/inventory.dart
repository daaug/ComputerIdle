import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: true,
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Typer',),
            Tab(text: 'Eraser',),
            Tab(text: 'Writer',),
            Tab(text: 'WTS',),
          ]
        ),
      ),
    );
  }
}
