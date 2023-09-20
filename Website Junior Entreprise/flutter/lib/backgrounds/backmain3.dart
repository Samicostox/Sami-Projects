import 'package:flutter/material.dart';

class backmain3 extends StatefulWidget {
  final Widget child;
  const backmain3({Key? key, required this.child}) : super(key: key);

  @override
  State<backmain3> createState() => _backmain3State();
}

class _backmain3State extends State<backmain3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(

        height:4800,
        width: size.width,
        child: Stack(


          children: [

            Positioned(

                top : 170,
                left: 0,


                child: Container(
                  height: 550,
                  width: size.width,
                  color:Color(0xfff7fbfd),
                )),

            Positioned(

                top : 680,
                left: 0,


                child: Container(
                  height: 900,
                  width: size.width,
                  color:Color(0xff81b0d0).withOpacity(0.3),
                )),

            Positioned(

                top : 1550,
                left: 0,


                child: Container(
                  height: 2000,
                  width: size.width,
                  color:Color(0xfff7fbfd),
                )),

            Positioned(

                top : 3700,
                left: 0,


                child: Container(
                  height: 1150,
                  width: size.width,
                  color:Color(0xff81b0d0).withOpacity(0.3),
                )),

            Positioned(

                top : 4400,
                left: 0,


                child: Container(
                  height: 1520,
                  width: size.width,
                  color:Color(0xff81b0d0),
                )),

            Positioned(
              top : 140,
              left: -250,
              child:  Container(
                width: 550,
                height: 550,

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff3f6f8)),
              ),),


            widget.child,



          ],



        ),










      ),
    );

  }
}
