
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'backgroundauth.dart';



class actualbackauth extends StatelessWidget {
  final Widget child;

  const actualbackauth({Key? key, required this.child,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(

        children: [
          Positioned(
            top: 0,
            left: 0,

            child: Stack(
              clipBehavior: Clip.none,

              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter8(),
                ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,

            child: Stack(
              clipBehavior: Clip.none,

              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter9(),
                ),
                child
              ],
            ),
          ),



        ],


      ),

    );

  }
}