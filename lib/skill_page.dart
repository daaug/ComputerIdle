import 'package:get/get.dart';
import 'package:medievidle/data.dart';
import 'package:flutter/material.dart';
import 'package:medievidle/items_list.dart';


class SkillPage extends StatelessWidget {
  const SkillPage({super.key,
    required this.objSkill,
  });

  final Rx objSkill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${objSkill().name} Jobs', style: TextStyle(color: globalColors[objSkill().name]),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: globalColors[objSkill().name],),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ItemsList(objSkill: objSkill),
      )
    );
  }
}
