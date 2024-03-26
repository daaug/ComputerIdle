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
          maxWidth: MediaQuery.of(context).size.width * 0.25,
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
          child: Padding(padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('qty:'),
                    Text('${widget.qty}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('level:'),
                    Text('${widget.level}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('xp:'),
                    Text('${widget.xp}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('time:'),
                    Text('${widget.fullTime}'),
                  ],
                ),
              ],
            ), // END Column
          )
        ), // END InkWell
    ); // END Container
  }
}
