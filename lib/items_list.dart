import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';


class ItemsList extends StatefulWidget {
  const ItemsList({super.key,
    required this.colsMap,
    required this.dataList,
  });

  final Map colsMap;
  final List dataList;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

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
        Duration(milliseconds: widget.dataList[id][widget.colsMap['time']]),
        (_){
          if(widget.dataList[id][widget.colsMap['xp']] + 1 >= ((widget.dataList[id][widget.colsMap['level']]/10)+1) * baseLevelXp){
            widget.dataList[id][widget.colsMap['level']] += 1;
            widget.dataList[id][widget.colsMap['xp']] = 0;
          } else {
            widget.dataList[id][widget.colsMap['xp']] += 1;
          }
          widget.dataList[id][widget.colsMap['qty']] += 1;
          setState(() {
            widget.dataList[id];
          });
          print('NAME: ${widget.dataList[id][0]}\tQty: ${widget.dataList[id][4]}\tXP: ${widget.dataList[id][3]}\tLEVEL: ${widget.dataList[id][2]} ');
        }
      );
    }

  } // runTimer()

  Expanded itemText(String title, int pos, String col){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${widget.dataList[pos][widget.colsMap[col]]}",
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
          for(var i = 0; i < widget.dataList.length; i++)
            Column(
              children: [
                InkWell(
                  onTap: () => print(i),
                  splashColor: globalAccentColor.withOpacity(0.2),
                  child: Container(
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
                              child: Text(widget.dataList[i][widget.colsMap['name']], style: TextStyle(color: globalFontAltColor), textAlign: TextAlign.center,),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(widget.dataList[i][widget.colsMap['active']] ? "working" : "stoped", 
                                textAlign: TextAlign.center,
                                style: TextStyle(color: widget.dataList[i][widget.colsMap['active']] ? const Color(0xFFffff00) : const Color(0xFFff0000)),
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
                            itemText("qty", i, "qty"),
                            itemText("lvl", i, "level"),
                            itemText("xp", i, "xp"),
                            itemText("t/ms", i, "time"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15) // Basic divider
              ],
            )
        ],
      ),
    );
  }
}

            
