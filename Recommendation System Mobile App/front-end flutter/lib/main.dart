import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nut/Food/foodDisplay.dart';
import 'package:nut/Pages/speech_reco.dart';
import 'package:nut/home.dart';
import 'package:nut/login/log.dart';
import 'package:provider/provider.dart';

import 'Provider/home2.dart';
import 'Provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ID(0,'bobo',base64Decode("toto")),
      child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

        initialRoute: '/login',
        routes: {

          '/login' : (context) => LoginScreen(),
          '/home' : (context) => home(i: 1),
          '/speech' : (context) => speech_reco()



        }
    );

  }
}

