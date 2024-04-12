import 'package:computer_idle/data.dart';
import 'package:computer_idle/typer_eraser.dart';
import 'package:flutter/material.dart';


class KeyboardPage extends StatelessWidget {
  const KeyboardPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: globalBackground,
        appBar: AppBar(
          title: const Text('Keyboard Jobs'),
          backgroundColor: globalBackground,
          foregroundColor: globalFontColor,
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.yellow,
            indicatorColor: Colors.yellow,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Typer',),
              Tab(text: 'Eraser',),
            ]
          ),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const TabBarView(
              children: [
                MyTyperEraser(typer: true,),
                MyTyperEraser(typer: false,),
              ],
            )
          )
        ),
      )
    );
  }
}

