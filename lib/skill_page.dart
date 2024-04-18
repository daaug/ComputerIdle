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
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ItemsList(
          colsMap: colsMap,
          dataList: dataList,
          name: name,
        ),
      );
  }
}
