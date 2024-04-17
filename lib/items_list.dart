import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';


class ItemsList extends StatefulWidget {
  const ItemsList({super.key,
    required this.colsMap,
    required this.dataList,
    required this.accentColor,
  });

  final Map colsMap;
  final List dataList;
  final Color accentColor;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

  int baseLevelXp = 30;

  Expanded itemText(String title, int pos, String column){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${widget.dataList[pos][widget.colsMap[column]]}",
              style: TextStyle(color: widget.accentColor)
            ),
          ]
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          for(var i = 0; i < widget.dataList.length; i++)
            if(widget.dataList[i][widget.colsMap['unlocked']])
              Column(
                children: [
                  InkWell(
                    onTap: () => print(i),
                    splashColor: widget.accentColor.withOpacity(0.2),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: widget.accentColor),
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
                            color: widget.accentColor,
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

            
