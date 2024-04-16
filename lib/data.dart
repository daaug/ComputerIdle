import 'dart:ui';

import 'package:get/get.dart';
import 'package:medievidle/models.dart';

// Objects
final objWoodcut = ObjSkill(name: "woodcut", dataList: dataWoodcut, colsMap: colsWoodcut).obs;
final objMine = ObjSkill(name: "mine", dataList: dataMine, colsMap: colsMine).obs;

// Globals
Color globalBackground = const Color(0xFF101010);
Color globalFontColor = const Color(0xFF00ff00);
Color globalFontAltColor = const Color(0xFFffff00);
Color globalAccentColor = const Color(0xFF00ff00);
Map globalColors = {
  "woodcut": const Color(0xFF00ff00),
  "mine": const Color(0xFF808080),
  "smith": const Color(0xFFffffff),
  "fish": const Color(0xFF00ffff),
};

Map currWorking = {
  "woodcut": {"id": "", "timestamp": ""},
  "mine": {"id": "", "timestamp": ""},
  "smith": {"id": "", "timestamp": ""},
  "fish": {"id": "", "timestamp": ""},
};

Map colsWoodcut = {
  'name': 0,
  'time': 1,
  'level': 2,
  'xp': 3,
  'qty': 4,
  'unlocked': 5,
  'active': 6,
};

final RxList<dynamic> dataWoodcut = RxList<dynamic>([
  ["Arborvitae",1500,0,0,0,true,false],
  ["Ash",1725,0,0,0,false,false],
  ["Basswood",1984,0,0,0,false,false],
  ["Black Birch",2281,0,0,0,false,false],
  ["Butternut",2624,0,0,0,false,false],
  ["Balsam Fir",3017,0,0,0,false,false],
  ["Yellow Birch",3470,0,0,0,false,false],
  ["Hawthorn",3990,0,0,0,false,false],
  ["Red Maple",4589,0,0,0,false,false],
  ["Gray Birch",5277,0,0,0,false,false],
  ["Chestnut",6068,0,0,0,false,false],
  ["Scarlet Oak",6979,0,0,0,false,false],
  ["Paper Birch",8025,0,0,0,false,false],
  ["Tulip Tree",9229,0,0,0,false,false],
  ["Black Locust",10614,0,0,0,false,false],
  ["Pitch Pine",12206,0,0,0,false,false],
  ["Bhutan Cypress",14036,0,0,0,false,false],
  ["Giant Sequoia",16142,0,0,0,false,false],
  ["Slippery Elm",18563,0,0,0,false,false],
  ["Sycamore",21348,0,0,0,false,false],
]);

Map colsMine = colsWoodcut;

List dataMine = [
  ["Salt",1700,0,0,0,true,false],
  ["Glass",1955,0,0,0,false,false],
  ["Crystal",2248,0,0,0,false,false],
  ["Sugar",2585,0,0,0,false,false],
  ["Stone",2973,0,0,0,false,false],
  ["Coal",3419,0,0,0,false,false],
  ["Tin",3932,0,0,0,false,false],
  ["Iron",4522,0,0,0,false,false],
  ["Gold",5200,0,0,0,false,false],
  ["Steel",5980,0,0,0,false,false],
  ["Obsidian",6877,0,0,0,false,false],
  ["Diamond",7909,0,0,0,false,false],
  ["Topaz",9095,0,0,0,false,false],
  ["Quartz",10460,0,0,0,false,false],
  ["Feldspar",12029,0,0,0,false,false],
  ["Apatite",13833,0,0,0,false,false],
  ["Fluorite",15908,0,0,0,false,false],
  ["Calcite",18294,0,0,0,false,false],
  ["Gypsum",21038,0,0,0,false,false],
  ["Talc",24194,0,0,0,false,false],
];
