import 'dart:convert';

import 'package:flutter/material.dart';

class card4 extends StatefulWidget {
  final String s;
  final String i;
  final Color c1;
  final Color c2;

  const card4(
      {Key? key,
        required this.s,
        required this.i,
        required this.c1,
        required this.c2})
      : super(key: key);

  @override
  State<card4> createState() => _card4State();
}

class _card4State extends State<card4> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: size.width/1.1,
          height: 200,
          child: SizedBox(
            width: size.width/1.1,
            height: 200,
            child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(widget.s,
                        style: TextStyle(fontSize: 25, color: Colors.white)),
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
                      width: 100,
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
