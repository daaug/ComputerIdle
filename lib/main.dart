import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/items_list.dart';
import 'package:medievidle/mine.dart';
import 'package:medievidle/woodcut.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medievidle',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: globalBackground,
          foregroundColor: globalFontColor,
          centerTitle: true,
        ),
        brightness: Brightness.dark,
        primaryColor: globalFontColor,
        fontFamily: "CourierPrime",
        scaffoldBackgroundColor: globalBackground,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 30.0,), // AppBar
          bodyMedium: TextStyle(fontSize: 21.0,), // Text
          labelLarge: TextStyle(fontSize: 24), // Button
        ),
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double sizedBoxH = 20;
  late Timer tWoodcut;
  late Timer tMine;
  late Timer tSmith;
  late Timer tFish;

  getScreenWidth(BuildContext ctx){return MediaQuery.of(ctx).size.width;}
  getScreenHeight(BuildContext ctx){return MediaQuery.of(ctx).size.height;}

  OutlinedButton myOutlinedButton(String title, Widget target, Color color){
    return OutlinedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => target)
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        )),
        minimumSize: MaterialStatePropertyAll(Size(getScreenWidth(context)*0.40, getScreenHeight(context)*0.10)),
        side: MaterialStateProperty.all(BorderSide(
          color: color,
          width: 2.0,
        )),
        foregroundColor: MaterialStateProperty.all(color)
      ),
      child: Text(title)
    );
  }

  @override
  void initState() {
    super.initState();
    
    if (currWorking["woodcut"]["id"] != "") {
      tWoodcut = Timer(Duration(milliseconds: int.parse(dataWoodcut[colsWoodcut["time"]])), (){
        
      });
    }

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: globalFontColor),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Divider(height: 1, color: globalAccentColor,),
        )
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sizedBoxH),
              const Text("V Skills V"),
              SizedBox(height: sizedBoxH),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 20,
                runSpacing: 20,
                children: [
                  myOutlinedButton("woodcut", const WoodcutPage(), const Color(0xFF00ff00)),
                  myOutlinedButton("mine", const MinePage(), const Color(0xFF808080)),
                  myOutlinedButton("smith", const WoodcutPage(), const Color(0xFFffffff)),
                  myOutlinedButton("fish", const WoodcutPage(), const Color(0xFF00ffff)),
                ],
              ),
              SizedBox(height: sizedBoxH),
              Divider(height: 1, color: globalAccentColor,),
              SizedBox(height: sizedBoxH),
              const Text("V current working V"),
              SizedBox(height: sizedBoxH),
              Column(
                children: [
                  currWorking["woodcut"]["id"] != "" ?
                    ItemsList(colsMap: colsWoodcut, dataList: dataWoodcut, accentColor: globalColors["woodcut"])
                    : Text("not woodcuting", style: TextStyle(color: globalColors["woodcut"])),

                  currWorking["mine"]["id"] != "" ?
                    ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors["mine"])
                    : Text("not mining", style: TextStyle(color: globalColors["mine"])),

                  currWorking["smith"]["id"] != "" ?
                    ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors["mine"])
                    : Text("not smithing", style: TextStyle(color: globalColors["smith"])),

                  currWorking["fish"]["id"] != "" ?
                    ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors["mine"])
                    : Text("not fishing", style: TextStyle(color: globalColors["fish"])),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}

