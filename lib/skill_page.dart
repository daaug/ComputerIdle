import 'package:medievidle/data.dart';
import 'package:flutter/material.dart';
import 'package:medievidle/items_list.dart';


class SkillPage extends StatelessWidget {
  const SkillPage({super.key,
    required this.colsMap,
    required this.dataList,
    required this.name,
  });

  final Map colsMap;
  final List dataList;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Jobs', style: TextStyle(color: globalColors[name]),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: globalColors[name],),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors[name]),
      )
    );
  }
}
