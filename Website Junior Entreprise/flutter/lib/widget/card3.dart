import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class card3 extends StatefulWidget {
  final String s;
  final String s2;
  final String s3;
  final String i;
  final Color c1;
  final Color c2;

  const card3({Key? key, required this.s, required this.i, required this.c1, required this.c2,required this.s2, required this.s3}) : super(key: key);

  @override
  State<card3> createState() => _card3State();
}

class _card3State extends State<card3> {


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Card (
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,


        elevation: 20,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(

          child: SizedBox(
            width: 520,
            height: 400,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 130,),
                Text(widget.s, style: TextStyle(fontSize: 25)),
                SizedBox(height: 20,),
                Text(widget.s2, style: TextStyle(fontSize: 25)),
                SizedBox(height: 20,),
                Text(widget.s3, style: TextStyle(fontSize: 25)),
                SizedBox(height: 20,),



              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.c1,
                widget.c2

              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(

              opacity: 0,
              image: AssetImage(widget.i),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

        ),
      ),

    );
  }
}
