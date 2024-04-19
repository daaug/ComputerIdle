import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/items_list.dart';
import 'package:medievidle/models.dart';


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
    return currWorking[name]["pos"] != 1000 ?
      MyItem(
        colsMap: cols,
        dataList: data,
        name: name,
        pos: currWorking[name]["pos"],
        currWorkingPos: currWorking[name]['id'],
      )
      : Text("not $gerund", style: TextStyle(color: globalColors[name]));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: sizedBoxH),
          const Text("V skills V"),
          SizedBox(height: sizedBoxH),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            spacing: 20,
            runSpacing: 20,
            children: [
              myOutlinedButton("woodcut", globalColors["woodcut"]),
              myOutlinedButton("mine", globalColors["mine"]),
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
                myCurrWorkElement("woodcut", "woodcuting", colsWoodcut, dataElements.dataWoodcut),
                myCurrWorkElement("mine", "mining", colsMine, dataElements.dataMine),
              ],
            )
          )
          ,
        ],
      ),
    );
  }
}

