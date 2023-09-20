import 'package:flutter/material.dart';

class backmain extends StatefulWidget {
  final Widget child;
  const backmain({Key? key, required this.child}) : super(key: key);

  @override
  State<backmain> createState() => _backmainState();
}

class _backmainState extends State<backmain> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: 3960,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
                top: 170,
                left: 0,
                child: Container(
                  height: 550,
                  width: size.width,
                  color: Color(0xfff7fbfd),
                )),
            Positioned(
                top: 680,
                left: 0,
                child: Container(
                  height: 550,
                  width: size.width,
                  color: Color(0xff81b0d0).withOpacity(0.3),
                )),
            Positioned(
                top: 1250,
                left: 0,
                child: Container(
                  height: 2000,
                  width: size.width,
                  color: Color(0xfff7fbfd),
                )),
            Positioned(
                top: 3000,
                left: 0,
                child: Container(
                  height: 550,
                  width: size.width,
                  color: Color(0xff81b0d0).withOpacity(0.3),
                )),
            Positioned(
                top: 3550,
                left: 0,
                child: Container(
                  height: 450,
                  width: size.width,
                  color: Color(0xff81b0d0),
                )),
            Positioned(
              top: 140,
              left: -250,
              child: Container(
                width: 550,
                height: 550,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xfff3f6f8)),
              ),
            ),
            Positioned(
              top: -50,
              left: size.width / 1.9,
              child: Container(
                  height: 680,
                  width: size.width / 2,
                  child: Image(
                    image: AssetImage(
                      'Assets/logo2sansback.png',
                    ),
                    height: 800,
                    width: 800,
                  )),
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
