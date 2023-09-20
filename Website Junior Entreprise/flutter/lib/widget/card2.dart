import 'dart:convert';

import 'package:flutter/material.dart';

class card2 extends StatefulWidget {
  final String s;
  final String i;
  final Color c1;
  final Color c2;

  const card2(
      {Key? key,
      required this.s,
      required this.i,
      required this.c1,
      required this.c2})
      : super(key: key);

  @override
  State<card2> createState() => _card2State();
}

class _card2State extends State<card2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 470,
          height: 300,
          child: SizedBox(
            width: 470,
            height: 300,
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 110,
                ),
                Text(widget.s,
                    style: TextStyle(fontSize: 35, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  width: 220,
                  height: 2,
                ),
              ],
            )),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.c1, widget.c2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
