import 'dart:async';

import 'package:flutter/material.dart';

// =================================================
// Start the object
// =================================================
DataElements dataElements = DataElements();

// =================================================
// Timers
// =================================================
Timer timerWoodcut = Timer(const Duration(milliseconds: 0), () {});
Timer timerMine = Timer(const Duration(milliseconds: 0), () {});

// =================================================
// DataElements definition
// =================================================
class DataElements extends ChangeNotifier {
  int baseLevelXp = 30;
  Map currWorking = {
    "woodcut": {"line": 1000, "timestamp": "", "timer": timerWoodcut},
    "mine": {"line": 1000, "timestamp": "", "timer": timerMine},
  };

  // =================================================
  // Woodcut
  // =================================================
  List dataWoodcut = [
    ["Arborvitae", 1500, 0, 0, 0, true, false],
    ["Ash", 1725, 0, 0, 0, false, false],
    ["Basswood", 1984, 0, 0, 0, false, false],
    ["Black Birch", 2281, 0, 0, 0, false, false],
    ["Butternut", 2624, 0, 0, 0, false, false],
    ["Balsam Fir", 3017, 0, 0, 0, false, false],
    ["Yellow Birch", 3470, 0, 0, 0, false, false],
    ["Hawthorn", 3990, 0, 0, 0, false, false],
    ["Red Maple", 4589, 0, 0, 0, false, false],
    ["Gray Birch", 5277, 0, 0, 0, false, false],
    ["Chestnut", 6068, 0, 0, 0, false, false],
    ["Scarlet Oak", 6979, 0, 0, 0, false, false],
    ["Paper Birch", 8025, 0, 0, 0, false, false],
    ["Tulip Tree", 9229, 0, 0, 0, false, false],
    ["Black Locust", 10614, 0, 0, 0, false, false],
    ["Pitch Pine", 12206, 0, 0, 0, false, false],
    ["Bhutan Cypress", 14036, 0, 0, 0, false, false],
    ["Giant Sequoia", 16142, 0, 0, 0, false, false],
    ["Slippery Elm", 18563, 0, 0, 0, false, false],
    ["Sycamore", 21348, 0, 0, 0, false, false],
  ];

  // =================================================
  // Mine
  // =================================================
  List dataMine = [
    ["Salt", 1700, 0, 0, 0, true, false],
    ["Glass", 1955, 0, 0, 0, false, false],
    ["Crystal", 2248, 0, 0, 0, false, false],
    ["Sugar", 2585, 0, 0, 0, false, false],
    ["Stone", 2973, 0, 0, 0, false, false],
    ["Coal", 3419, 0, 0, 0, false, false],
    ["Tin", 3932, 0, 0, 0, false, false],
    ["Iron", 4522, 0, 0, 0, false, false],
    ["Gold", 5200, 0, 0, 0, false, false],
    ["Steel", 5980, 0, 0, 0, false, false],
    ["Obsidian", 6877, 0, 0, 0, false, false],
    ["Diamond", 7909, 0, 0, 0, false, false],
    ["Topaz", 9095, 0, 0, 0, false, false],
    ["Quartz", 10460, 0, 0, 0, false, false],
    ["Feldspar", 12029, 0, 0, 0, false, false],
    ["Apatite", 13833, 0, 0, 0, false, false],
    ["Fluorite", 15908, 0, 0, 0, false, false],
    ["Calcite", 18294, 0, 0, 0, false, false],
    ["Gypsum", 21038, 0, 0, 0, false, false],
    ["Talc", 24194, 0, 0, 0, false, false],
  ];

  // Manages single skill element data
  // like quantity, xp, level and if its unlocked
  void addUnitToSkill(List list, Map cols, int line) {
    list[line][cols['qty']]++;

    // Check if curr xp is bigger than the curr xp cap
    if (list[line][cols['xp']] + 1 >=
        ((list[line][cols['level']] / 10) + 1) * baseLevelXp) {
      list[line][cols['xp']] = 0;
      list[line][cols['level']]++;
      // Enable the next element in list, but, If current line is the
      // last in the list, do not try to enable next non-existent element
      if (list[line][cols['level']] >= 3 && line < list.length - 1) {
        list[line + 1][cols['unlocked']] = true;
      }
    } else {
      list[line][cols['xp']]++;
    }
    notifyListeners();
  }

  // Start timers for each individual skill targeted
  void startSkillTimer(List list, Map cols, int line, String name) {
    // clicking in the same skill element stop the timer
    if (currWorking[name]["line"] == line) {
      currWorking[name]['timer'].cancel();
      currWorking[name]["line"] = 1000;
      list[line][cols['active']] = false;
    } else {
      currWorking[name]["line"] = line;
      list[line][cols['active']] = true;

      // Destroy the current timer
      if (currWorking[name]['timer'].isActive) {
        currWorking[name]['timer'].cancel();
      }

      // Enable timer
      currWorking[name]['timer'] =
          Timer.periodic(Duration(milliseconds: list[line][cols['time']]), (t) {
        addUnitToSkill(list, cols, line);
      });
    }
    notifyListeners();
  }
}

// =================================================
// Helper columns
// =================================================
Map colsWoodcut = {
  'name': 0,
  'time': 1,
  'level': 2,
  'xp': 3,
  'qty': 4,
  'unlocked': 5,
  'active': 6,
};

Map colsMine = {
  'name': 0,
  'time': 1,
  'level': 2,
  'xp': 3,
  'qty': 4,
  'unlocked': 5,
  'active': 6,
};
