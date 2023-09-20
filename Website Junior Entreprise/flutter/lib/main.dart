import 'package:flutter/material.dart';
import 'package:je_website/Screeens%20home/Reallysmall.dart';
import 'package:je_website/Screeens%20home/phone.dart';
import 'package:je_website/Screeens%20home/smallPhone.dart';

import 'package:je_website/responsive.dart';

import 'Screeens home/large.dart';
import 'Screeens home/small.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

        initialRoute: '/home',
        routes: {
          '/home' : (context) => ResponsiveWidget(largeScreen: reallysmall(),smallScreen: reallysmall(),mediumScreen:reallysmall(), reallysmallScreen : reallysmall() ,phone: Phone(),smallphone: smallphone(),  ),


        }
    );
  }
}