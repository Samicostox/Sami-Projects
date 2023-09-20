import 'dart:convert';

import 'package:flutter/material.dart';

class card extends StatefulWidget {
  final String s;
  final String i;
  final Color c1;
  final Color c2;

  const card({Key? key, required this.s, required this.i, required this.c1, required this.c2}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {


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

            child: new InkWell(
              onTap: () {
                print("tapped");
              },
              child: SizedBox(
              width: 600,
              height: 480,
              child:
              Center(child:

              Column(
                children: [
                  SizedBox(height: 200,),
                  Text(widget.s, style: TextStyle(fontSize: 35)),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF98BDD8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 220,
                    height: 5,

                  ),


                ],
              )),
            ),),
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
