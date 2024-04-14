import 'package:medievidle/data.dart';
import 'package:flutter/material.dart';
import 'package:medievidle/items_list.dart';


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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Divider(height: 2, color: globalAccentColor,)
          ),
        ),
        body: Center(
          child: ItemsList(colsMap: colsWoodcut, dataList: dataWoodcut,),
        )
      )
    );
  }
}

