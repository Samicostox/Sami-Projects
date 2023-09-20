import 'package:flutter/material.dart';
class buttonHover extends StatefulWidget {
  final String title;
  final ScrollController controller;
  final double position;

  const buttonHover({Key? key, required this.title,required this.controller, required this.position}) : super(key: key);

  @override
  State<buttonHover> createState() => _buttonHoverState();
}

class _buttonHoverState extends State<buttonHover> {
  bool isHover = false;

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

            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,


              ),

              onPressed: () { widget.controller.animateTo(widget.position, duration: Duration(milliseconds: 1000),curve: Curves.ease,); },
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 20,
                  color: isHover ? Color(0xFF98BDD8) : Colors.black,

                ),
                child: Text(widget.title),

              ),
            ),
          ),
          SizedBox(height: 3,),
          if (isHover == true) ...[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF98BDD8),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              width: 30,
              height: 3,

            )

          ] else ...[
            Container(
              width: 0,
              height: 0,
            )

          ]
        ],

      ),

    );
  }
}
