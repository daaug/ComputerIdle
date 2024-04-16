import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/items_list.dart';
import 'package:medievidle/skill_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double sizedBoxH = 20;

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
                  myOutlinedButton("woodcut", SkillPage(name: "woodcut", colsMap: colsWoodcut, dataList: dataWoodcut), globalColors["woodcut"]),
                  myOutlinedButton("mine", SkillPage(name: "mine", colsMap: colsMine, dataList: dataMine), globalColors["mine"]),
                  myOutlinedButton("smith", SkillPage(name: "smith", colsMap: colsWoodcut, dataList: dataWoodcut), globalColors["smith"]),
                  myOutlinedButton("fish", SkillPage(name: "fish", colsMap: colsWoodcut, dataList: dataWoodcut), globalColors["fish"]),
                ],
              ),
              SizedBox(height: sizedBoxH),
              Divider(height: 1, color: globalAccentColor,),
              SizedBox(height: sizedBoxH),
              const Text("V current working V"),
              SizedBox(height: sizedBoxH),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
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
                )
              )
              ,
            ],
          ),
        )
      ),
    );
  }
}

