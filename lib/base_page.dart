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

  // Manages single skill element data
  // like quantity, xp, level and if its unlocked
  void addUnitToSkill(List data, Map cols, int pos){
    data[pos][cols['qty']] = data[pos][cols['qty']] + 1;
    
    // Check if curr xp is bigger than the curr xp cap
    if(data[pos][cols['xp']] + 1 >= ((data[pos][cols['level']]/10) + 1) * baseLevelXp){
      data[pos][cols['xp']] = 0;
      data[pos][cols['level']]++;
      // Enable the next element in list, but, If current pos is the
      // last in the list, do not try to enable next non-existent element
      if(data[pos][cols['level']] >= 3 && pos < data.length - 1){
        data[pos + 1][cols['unlocked']] = true;
      }
    } else {
      data[pos][cols['xp']] = data[pos][cols['xp']] + 1;
    }
    setState(() {
      data;
    });
  }

  // Start timers for each individual skill targeted
  void startSkillTimer(List data, Map cols, int pos, String name){
    // clicking in the same skill element stop the timer
    if (currWorking[name]["pos"] == pos){
      currWorking[name]['timer'].cancel();
      currWorking[name]["pos"] = 1000;
      data[pos][cols['active']] = false;
    } else {
      currWorking[name]["pos"] = pos;
      data[pos][cols['active']] = true;

      if(currWorking[name]['timer'].isActive){
        currWorking[name]['timer'].cancel();
      }

      // Enable timer
      currWorking[name]['timer'] = Timer.periodic(
        Duration( milliseconds: data[pos][cols['time']]),
          (t) { addUnitToSkill(data, cols, pos);  }
      );

    }
    setState(() {
      currWorking;
      data;
    });
  }

  // Change the page
  void updCurrPage(String target){
    setState(() {
      currPageName = target;
    });
  }

  @override
  void initState() {
    
    dataElements.addListener(() {
      setState(() { });
    });

    timerWoodcut = Timer(const Duration(milliseconds: 0), () { });
    timerMine = Timer(const Duration(milliseconds: 0), () { });

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


    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        dataElements.updateElement(dataElements.dataWoodcut, 0, 4);
      });
    });

    super.initState();
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
