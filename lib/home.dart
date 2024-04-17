import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/items_list.dart';
import 'package:medievidle/skill_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,
    required this.updCurrPage,
  });

  final Function updCurrPage;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double sizedBoxH = 20;

  getScreenWidth(BuildContext ctx){return MediaQuery.of(ctx).size.width;}
  getScreenHeight(BuildContext ctx){return MediaQuery.of(ctx).size.height;}

  OutlinedButton myOutlinedButton(String title, Color color){
    return OutlinedButton(
      onPressed: () => widget.updCurrPage(title),
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

  myCurrWorkElement(String name, String gerund, Map cols, List data){
    return currWorking[name]["id"] != "" ?
      ItemsList(colsMap: cols, dataList: data, accentColor: globalColors[name])
      : Text("not $gerund", style: TextStyle(color: globalColors[name]));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              myOutlinedButton("woodcut", globalColors["woodcut"]),
              myOutlinedButton("mine", globalColors["mine"]),
              myOutlinedButton("smith", globalColors["smith"]),
              myOutlinedButton("fish", globalColors["fish"]),
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
                myCurrWorkElement("woodcut", "woodcuting", colsWoodcut, dataWoodcut),
                myCurrWorkElement("mine", "mining", colsMine, dataMine),

                //currWorking["smith"]["id"] != "" ?
                //  ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors["mine"])
                //  : Text("not smithing", style: TextStyle(color: globalColors["smith"])),

                //currWorking["fish"]["id"] != "" ?
                //  ItemsList(colsMap: colsMine, dataList: dataMine, accentColor: globalColors["mine"])
                //  : Text("not fishing", style: TextStyle(color: globalColors["fish"])),
              ],
            )
          )
          ,
        ],
      ),
    );
  }
}

