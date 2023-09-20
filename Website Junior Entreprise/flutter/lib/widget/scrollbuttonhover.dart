import 'package:flutter/material.dart';
import 'dart:ui';
class buttonHover2 extends StatefulWidget {
  final String title;
  final ScrollController controller;
  final double position;
  final double min;
  final double max;
  const buttonHover2({Key? key, required this.title,required this.controller, required this.position, required this.min, required this.max}) : super(key: key);

  @override
  State<buttonHover2> createState() => _buttonHover2State();
}

class _buttonHover2State extends State<buttonHover2> {
  bool isHover = false;
  Color blue = Color(0xff122f54);
  Color gold = Color(0xffc29248);
  Color bluehovver = Color(0xff2a6bc0);

  _scrollListener() {
    if (widget.controller.position.pixels > widget.min && widget.controller.position.pixels < widget.max){
      setState(() {
        isHover = true;
      });
    }else if(widget.controller.position.pixels < widget.min || widget.controller.position.pixels > widget.max){
      setState(() {
        isHover = false;
      });
    }
  }
  void initState() {

    widget.controller.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MouseRegion(
      onEnter: (f){
        setState(() {
          isHover = true;
        });
      },
      onExit: (f) {
        setState(() {
          isHover = false;
        });
      } ,

      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ElevatedButton (

              style: ElevatedButton.styleFrom(
                backgroundColor: isHover ?  gold : blue,
                shadowColor: Colors.transparent,


              ),
              onPressed: () { widget.controller.animateTo(widget.position, duration: Duration(milliseconds: 1000),curve: Curves.ease,);},
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 17,
                  //letterSpacing: 1.5,
                  //fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                  color: isHover ? bluehovver : gold,

                ),
                child: Text(widget.title,

                ),

              ),

            ),
          ),
          SizedBox(height: 3,),

        ],

      ),

    );
  }
}