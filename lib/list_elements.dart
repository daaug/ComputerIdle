import 'package:computer_idle/data.dart';
import 'package:flutter/material.dart';


class MyElement extends StatefulWidget {
  const MyElement({super.key,
    required this.name,
    required this.cost,
    required this.id,
    required this.level,
    required this.qty,
    required this.fullTime,
    required this.currTime,
    required this.xp,
    required this.runTimer,
  });

  final String name;
  final int cost;
  final int id;
  final int level;
  final int qty;
  final int fullTime;
  final int currTime;
  final int xp;
  final Function runTimer;

  @override
  State<MyElement> createState() => _MyElementState();
}

class _MyElementState extends State<MyElement> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.runTimer(widget.id),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFF000000),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded( // Skill Name
              flex: 3,
              child: Text(widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Row( // First Row
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('qty: ${widget.qty}'),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: widget.cost != 0 ? Text('cost: ${widget.cost}') : const Text(''),
                      )
                    ],
                  ),
                  Row( // Second Row
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('level: ${widget.level}'),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('xp: ${widget.xp}/${(((kbdData[widget.id][kbdCols['level']]/10)+1) * 30).toInt()}'),
                      ),
                    ],
                  ),
                  Text('time: ${widget.fullTime}ms'),
                ],
              ),
            )
          ],
        ), // END Row
      )
    ); // END Container
  }
}
