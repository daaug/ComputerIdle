import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/models.dart';

// =================================================
// List to render individuals
// =================================================
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
                line: i,
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
    required this.line,
  });

  final String name;
  final Map colsMap;
  final List dataList;
  final int line;

  @override
  State<MyItem> createState() => _MyItemState();
}

// =================================================
// Individual element
// =================================================
class _MyItemState extends State<MyItem> {

  Expanded itemText(String title, int line, String column){
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: title,
          style: TextStyle(color: globalFontAltColor),
          children: [
            TextSpan(text: "\n${widget.dataList[line][widget.colsMap[column]]}",
              style: TextStyle(color: globalColors[widget.name])
            ),
          ]
        ),
      )
    );
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
  void dispose() {
    dataElements.removeListener((){});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            dataElements.startSkillTimer(
              widget.dataList,
              widget.colsMap,
              widget.line,
              widget.name
            );
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
                      child: Text(widget.dataList[widget.line][widget.colsMap['name']], style: TextStyle(color: globalFontAltColor), textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(widget.dataList[widget.line][widget.colsMap['active']] ? "working" : "stoped", 
                        textAlign: TextAlign.center,
                        style: TextStyle(color: widget.dataList[widget.line][widget.colsMap['active']] ? const Color(0xFFffff00) : const Color(0xFFff0000)),
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
                    itemText("qty", widget.line, "qty"),
                    itemText("lvl", widget.line, "level"),
                    itemText("xp", widget.line, "xp"),
                    itemText("t/ms", widget.line, "time"),
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
