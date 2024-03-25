import 'dart:async';

import 'package:computer_idle/data.dart';
import 'package:computer_idle/list_elements.dart';
import 'package:flutter/material.dart';


class KeyboardPage extends StatefulWidget {
  const KeyboardPage({super.key,});

  @override
  State<KeyboardPage> createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardPage> {

  @override
  void initState() {
    super.initState();
    kbdData;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Jobs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Typer',),
              Tab(text: 'Eraser',),
              Tab(text: 'Writer',),
              Tab(text: 'WTS',),
            ]
          ),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TabBarView(
              children: [
                MyTyper(),
                Text('no letters'),
                Text('words'),
                Text('no words'),
              ],
            )
          )
        ),
      )
    );
  }
}

class MyTyper extends StatefulWidget {
  const MyTyper({super.key,});

  @override
  State<MyTyper> createState() => _MyTyperState();
}

class _MyTyperState extends State<MyTyper> {

  int baseLevelXp = 30;
  late Timer timer;

  runTimer(int sec, int id){
    timer = Timer.periodic(
      Duration(milliseconds: sec),
      (t){
        if(kbdData[id][kbdCols['xp']] + 1 >= ((kbdData[id][kbdCols['level']]/10)+1) * baseLevelXp){
          kbdData[id][kbdCols['level']] += 1;
          kbdData[id][kbdCols['xp']] = 0;
          kbdData[id][kbdCols['qty']] += 1;
        } else {
          kbdData[id][kbdCols['xp']] += 1;
          kbdData[id][kbdCols['qty']] += 1;
        }
        setState(() {
          kbdData[id];
        });
        print('NAME: ${kbdData[id][0]}\tQty: ${kbdData[id][4]}\tXP: ${kbdData[id][3]}\tLEVEL: ${kbdData[id][2]} ');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      children: [
        for(var i = 0; i < kbdData.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MyElement(
              name: kbdData[i][kbdCols['name']],
              cost: 0,
              level: kbdData[i][kbdCols['level']],
              id: i,
              qty: kbdData[i][kbdCols['qty']],
              fullTime: kbdData[i][kbdCols['time']],
              currTime: 10,
              xp: kbdData[i][kbdCols['xp']],
              runTimer: runTimer,
            ),
          )
      ],
    );
  }
}