import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/models.dart';


class ItemsList extends StatefulWidget {
  const ItemsList({super.key,
    required this.name,
    required this.colsMap,
    required this.dataList,
  });

  final String name;
  final Map colsMap;
  final List dataList;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {

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
          for(var i = 0; i < widget.dataList.length; i++)
            if(widget.dataList[i][widget.colsMap['unlocked']])
              MyItem(
                name: widget.name,
                colsMap: widget.colsMap,
                dataList: widget.dataList,
                pos: i,
                currWorkingPos: currWorking[widget.name]['pos'],
              )
        ],
      ),
    );
  }
}

            
class MyItem extends StatefulWidget {
  const MyItem({super.key,
    required this.name,
    required this.colsMap,
    required this.dataList,
    required this.pos,
    required this.currWorkingPos,
  });

  final String name;
  final Map colsMap;
  final List dataList;
  final int pos;
  final int currWorkingPos;

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {

  Expanded itemText(String title, int pos, String column){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${widget.dataList[pos][widget.colsMap[column]]}",
              style: TextStyle(color: globalColors[widget.name])
            ),
          ]
        ),
      )
    );
  }

  @override
  void dispose() {
    dataElements.removeListener((){});
    super.dispose();
  }

  @override
  void initState() {
    dataElements.addListener(() {
      if (mounted){
        setState(() { });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
          },
          splashColor: globalColors[widget.name].withOpacity(0.2),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: globalColors[widget.name]),
            ),
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(widget.dataList[widget.pos][widget.colsMap['name']], style: TextStyle(color: globalFontAltColor), textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(widget.dataList[widget.pos][widget.colsMap['active']] ? "working" : "stoped", 
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.dataList[widget.pos][widget.colsMap['active']] ? const Color(0xFFffff00) : const Color(0xFFff0000)),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: globalColors[widget.name],
                  height: 2,
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    itemText("qty", widget.pos, "qty"),
                    itemText("lvl", widget.pos, "level"),
                    itemText("xp", widget.pos, "xp"),
                    itemText("t/ms", widget.pos, "time"),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15) // Basic divider
      ],
    );
  }
}
