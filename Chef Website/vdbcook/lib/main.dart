import 'package:flutter/material.dart';
import 'package:vdbcook/Home/home.dart';
import 'package:vdbcook/responsive/responsive.dart';

import 'Home/Phone.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,



        initialRoute: '/home',
        routes: {

          '/home' : (context) => ResponsiveWidget(largeScreen: home(), mediumScreen: home(), phone: Phone()),



        }
    );

  }
}

