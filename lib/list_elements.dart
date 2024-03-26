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
    return  Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFF000000),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child:InkWell(
          onTap: () => widget.runTimer(widget.id),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('qty:'),
                        widget.cost != 0 ? const Text('cost:') : const Text(''),
                        const Text('level:'),
                        const Text('xp:'),
                        const Text('time:'),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${widget.qty}'),
                          widget.cost != 0 ? Text('${widget.cost}') : const Text(''),
                          Text('${widget.level}'),
                          Text('${widget.xp}/${(((kbdData[widget.id][kbdCols['level']]/10)+1) * 30).toInt()}'),
                          Text('${widget.fullTime}ms'),
                        ],   
                      )
                    ),
                  ],
                ),
              )
            ],
          ), // END Row
        ), // END InkWell
    ); // END Container
  }
}
