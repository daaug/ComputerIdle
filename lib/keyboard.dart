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
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TabBarView(
              children: [
                MyTyper(erase: false),
                MyTyper(erase: true),
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
  const MyTyper({super.key,
    required this.erase,
  });

  final bool erase;

  @override
  State<MyTyper> createState() => _MyTyperState();
}

class _MyTyperState extends State<MyTyper> {

  int baseLevelXp = 30;
  late Timer timer;
  int currWorkingId = 1000;

  eraseCheck(int id){
    if(widget.erase){
      if(kbdData[id][kbdCols['qty']] - 1 <= 0){
        kbdData[id][kbdCols['qty']] = 0;
        timer.cancel();
      } else {
        kbdData[id][kbdCols['qty']] -= 1;
      }
    } else {
      kbdData[id][kbdCols['qty']] += 1;
    }
  }

  runTimer(int id){
    if (timer.isActive && id == currWorkingId) {
      timer.cancel();
    } else {
      currWorkingId = id;
      timer.cancel();
      timer = Timer.periodic(
        Duration(milliseconds: kbdData[id][kbdCols['time']]),
        (t){
          if(kbdData[id][kbdCols['xp']] + 1 >= ((kbdData[id][kbdCols['level']]/10)+1) * baseLevelXp){
            kbdData[id][kbdCols['level']] += 1;
            kbdData[id][kbdCols['xp']] = 0;
            eraseCheck(id);
          } else {
            kbdData[id][kbdCols['xp']] += 1;
            eraseCheck(id);
          }
          setState(() {
            kbdData[id];
          });
          print('NAME: ${kbdData[id][0]}\tQty: ${kbdData[id][4]}\tXP: ${kbdData[id][3]}\tLEVEL: ${kbdData[id][2]} ');
        }
      );
    }

  } // runTimer()

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(milliseconds: 1), () {});

  } // initState()

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      alignment: WrapAlignment.center,
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
