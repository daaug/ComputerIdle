import 'package:medievidle/data.dart';
import 'package:flutter/material.dart';
import 'package:medievidle/items_list.dart';


class WoodcutPage extends StatelessWidget {
  const WoodcutPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Woodcut Jobs'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: globalAccentColor,),
        )
      ),
      body: ItemsList(colsMap: colsWoodcut, dataList: dataWoodcut),
    );
  }
}

