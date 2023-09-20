import 'package:flutter/material.dart';


import 'backgroundauth.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Positioned(
            top: 0,
            left: 0,

            child: Stack(
              clipBehavior: Clip.none,

              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter10(),
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
                  painter: RPSCustomPainter11(),
                ),

              ],
            ),
          ),
          Positioned(
            top: -30,
            left: 210,
            child: Container(
              height: 230,
                width: 230,
                child: Image.asset('Assets/logovault.png')),),

          Positioned(
            bottom: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,

              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter12(),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,

              children: [
                CustomPaint(
                  size: Size(size.width, size.height),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter13(),
                ),

              ],
            ),
          ),
          child
        ],
      ),
    );
  }
}

