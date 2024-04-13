import 'dart:async';

import 'package:medievidle/data.dart';
import 'package:flutter/material.dart';


class WoodcutPage extends StatelessWidget {
  const WoodcutPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: globalBackground,
        appBar: AppBar(
          title: const Text('Woodcut Jobs'),
          backgroundColor: globalBackground,
          foregroundColor: globalFontColor,
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.yellow,
            indicatorColor: Colors.yellow,
            unselectedLabelColor: Colors.grey,
            dividerColor: globalAccentColor,
            tabs: const [
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
                Padding(padding: EdgeInsets.only(top: 20),
                  child: WoodcutList(typer: true,),
                ),
                WoodcutList(typer: false,),
              ],
            )
          )
        ),
      )
    );
  }
}


class WoodcutList extends StatefulWidget {
  const WoodcutList({super.key,
    required this.typer,
  });

  final bool typer;

  @override
  State<WoodcutList> createState() => _WoodcutListState();
}

class _WoodcutListState extends State<WoodcutList> {

  int baseLevelXp = 30;
  late Timer timer;
  int currWorkingId = 1000;
  double cellHeight = 45;

  runTimer(int id){
    if (timer.isActive && id == currWorkingId) {
      timer.cancel();
    } else {
      currWorkingId = id;
      timer.cancel();
      timer = Timer.periodic(
        Duration(milliseconds: dataWoodcut[id][colsWoodcut['time']]),
        (_){
          if(dataWoodcut[id][colsWoodcut['xp']] + 1 >= ((dataWoodcut[id][colsWoodcut['level']]/10)+1) * baseLevelXp){
            dataWoodcut[id][colsWoodcut['level']] += 1;
            dataWoodcut[id][colsWoodcut['xp']] = 0;
          } else {
            dataWoodcut[id][colsWoodcut['xp']] += 1;
          }
          dataWoodcut[id][colsWoodcut['qty']] += 1;
          setState(() {
            dataWoodcut[id];
          });
          print('NAME: ${dataWoodcut[id][0]}\tQty: ${dataWoodcut[id][4]}\tXP: ${dataWoodcut[id][3]}\tLEVEL: ${dataWoodcut[id][2]} ');
        }
      );
    }

  } // runTimer()

  Expanded itemList(String title, int pos, String col){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${dataWoodcut[pos][colsWoodcut[col]]}",
              style: TextStyle(color: globalAccentColor)
            ),
          ]
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(milliseconds: 1000), () {});

  } // initState()

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for(var i = 0; i < dataWoodcut.length; i++)
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: globalAccentColor),
                  ),
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(dataWoodcut[i][colsWoodcut['name']], style: TextStyle(color: globalFontAltColor), textAlign: TextAlign.center,),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(dataWoodcut[i][colsWoodcut['active']] ? "working" : "stoped", 
                              textAlign: TextAlign.center,
                              style: TextStyle(color: dataWoodcut[i][colsWoodcut['active']] ? const Color(0xFFffff00) : const Color(0xFFff0000)),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: globalAccentColor,
                        height: 2,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          itemList("qty", i, "qty"),
                          itemList("lvl", i, "level"),
                          itemList("xp", i, "xp"),
                          itemList("t/ms", i, "time"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15) // Basic divisor
              ],
            )
          
        ],
      ),
    );
  }
}

            
