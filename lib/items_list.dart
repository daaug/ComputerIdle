import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medievidle/data.dart';


class ItemsList extends StatefulWidget {
  const ItemsList({super.key,
    required this.objSkill,
  });

  final Rx objSkill;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  int baseLevelXp = 30;
  double cellHeight = 45;

  //runTimer(int id){
  //  if (timer.isActive && id == currWorkingId) {
  //    timer.cancel();
  //  } else {
  //    currWorkingId = id;
  //    timer.cancel();
  //    timer = Timer.periodic(
  //      Duration(milliseconds: widget.objSkill().dataList[id][widget.objSkill().colsMap['time']]),
  //      (_){
  //        if(widget.objSkill().dataList[id][widget.objSkill().colsMap['xp']] + 1 >= ((widget.objSkill().dataList[id][widget.objSkill().colsMap['level']]/10)+1) * baseLevelXp){
  //          widget.objSkill().dataList[id][widget.objSkill().colsMap['level']] += 1;
  //          widget.objSkill().dataList[id][widget.objSkill().colsMap['xp']] = 0;
  //        } else {
  //          widget.objSkill().dataList[id][widget.objSkill().colsMap['xp']] += 1;
  //        }
  //        widget.objSkill().dataList[id][widget.objSkill().colsMap['qty']] += 1;
  //        setState(() {
  //          widget.objSkill().dataList[id];
  //        });
  //        print('NAME: ${widget.objSkill().dataList[id][0]}\tQty: ${widget.objSkill().dataList[id][4]}\tXP: ${widget.objSkill().dataList[id][3]}\tLEVEL: ${widget.objSkill().dataList[id][2]} ');
  //      }
  //    );
  //  }
  //
  //} // runTimer()

  Expanded itemText(String title, int pos, String column){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${widget.objSkill().dataList[pos][widget.objSkill().colsMap[column]]}",
              style: TextStyle(color: globalColors[widget.objSkill().name])
            ),
          ]
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();

  } // initState()

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          for(var i = 0; i < widget.objSkill().dataList.length; i++)
            if(widget.objSkill().dataList[i][widget.objSkill().colsMap['unlocked']])
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      widget.objSkill().dataList[i][widget.objSkill().colsMap['active']] = true;
                      widget.objSkill.update;
                    },
                    splashColor: globalColors[widget.objSkill().name].withOpacity(0.2),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: globalColors[widget.objSkill().name]),
                      ),
                      child: Column(
                        children: [
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(widget.objSkill().dataList[i][widget.objSkill().colsMap['name']], style: TextStyle(color: globalFontAltColor), textAlign: TextAlign.center,),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(widget.objSkill().dataList[i][widget.objSkill().colsMap['active']] ? "working" : "stoped", 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: widget.objSkill().dataList[i][widget.objSkill().colsMap['active']] ? const Color(0xFFffff00) : const Color(0xFFff0000)),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: globalColors[widget.objSkill().name],
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

            
