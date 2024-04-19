import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/home.dart';
import 'package:medievidle/models.dart';
import 'package:medievidle/skill_page.dart';


class MyBasePage extends StatefulWidget {
  const MyBasePage({super.key,});

  @override
  State<MyBasePage> createState() => _MyBasePageState();
}

class _MyBasePageState extends State<MyBasePage> {

  String currPageName = 'home';
  late Map myPages;

  // Change the page
  void updCurrPage(String target){
    setState(() {
      currPageName = target;
    });
  }

  @override
  void initState() {
    
    //dataElements.addListener(() {
    //  if (mounted){
    //    setState(() { });
    //  }
    //});


    myPages = {
      'home': {
        'widget': MyHomePage(updCurrPage: updCurrPage,),
        'name': 'home',
      },
      'woodcut': {
        'widget': SkillPage(name: "woodcut", dataList: dataElements.dataWoodcut, colsMap: colsWoodcut,),
        'name': 'woodcut',
      },
      'mine': {
        'widget': SkillPage(name: "mine", dataList: dataElements.dataMine, colsMap: colsMine,),
        'name': 'mine',
      },
    };

    super.initState();
  }

  @override
  void dispose() {
    //dataElements.removeListener((){});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: currPageName != 'home' ?
        IconButton(
          onPressed: () {
            updCurrPage('home');
          },
          icon: const Icon(Icons.arrow_back)
        ):null,
        title: Text(myPages[currPageName]['name'], style: TextStyle(color: globalColors[currPageName]),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: globalColors[currPageName],),
        )
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            //Text("${dataElements.dataWoodcut[0][colsWoodcut['qty']]}"),
            myPages[currPageName]['widget']
          ],
        ),
      )
    );
  }
}
