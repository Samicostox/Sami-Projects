
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Food/food_page.dart';
import 'package:nut/Pages/food_pagefristrating.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../Data/Food.dart';
import '../Provider/provider.dart';


class firstrating extends StatefulWidget {
  const firstrating({Key? key}) : super(key: key);

  @override
  State<firstrating> createState() => _firstratingState();
}

class _firstratingState extends State<firstrating> {
  final controller = TextEditingController();

  Food food2 = Food("", 0, "", 0, base64Decode("image_memory"), "");

  int n = 0;
  List<food_new> display = [];
  var items = <Food>[];
  List<Food> foods = [];

  int id = 0;






  var url = Uri.parse('http://10.0.2.2:8000/api/meal');
  Future save() async {
    display.clear();
    var res = await http.get(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},


    );
    print('avant code 20000');
    if (res.statusCode == 200) {
      print('test');

      Map data = jsonDecode(res.body) as Map;
      print('test2');
      var a = data['msg'];
      var b = data['bet_request_id'];

      // don't forget in the futur to add bet_request_id

      for(var u in a){
        food_new food = food_new("", "", 0, "", [], 0,[],0,[],[]);

        food.name = u['name'];
        print(food.name);

        food.id = u['id'];
        print(food.id);

        food.ingredients = u['ingredients'];

        food.tags = u['tags'];

        food.steps = u['steps'];

        food.imageurl = u['foodpic'];

        food.nutri_values = u['nutri_values'];

        food.ratings = u['rating'];

        food.n_steps = u['n_steps'];

        food.description = u['description'];
        print('toto');
        display.add(food);

      }

      print(display);



    }
    return display;
  }

  late final Future myFuture;

  @override
  void initState() {
    display.clear();
    myFuture = save();
    print('HHHHHHHHHHHHHHHHHHHHHHHHHHH');
    print(display.length);



  }




  @override
  Widget build(BuildContext context) {





    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      body: FutureBuilder(
        future : myFuture,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: Container(
                width: 100,
                height: 100,
                child: Lottie.asset('lotties/loading-blue.json')));
          } else
          { return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              height: (size.height/6)*display.length+size.height/3.7,
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                children: [


                  SizedBox(height: 40,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text('Hi ' + Provider.of<ID>(context,listen: false).getName() + ' 👋',
                            style: TextStyle(
                                color: Color(0xFF086200),
                                fontSize: 35,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold
                            ),),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 11.5,),


                  SizedBox(height: 30,),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
                    child: Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Choose a meal that you like !',
                            style: TextStyle(
                                color: Color(0xFF086200),
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(height: 30,),



                  Expanded(
                    child: Container(
                      height: size.height*display.length/50,

                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: display.length,
                          itemBuilder: (BuildContext context,int index) {
                            print("herrrrree");
                            print(display);
                            print(display.length);
                            return fpfirstrating(food: display[index]);

                          }),
                    ),

                  ),


                ],
              ),
            ),
          ); }

        },


      ),


    );

  }

  Future<void> setValue(Future<dynamic> food) async {

    setState(() {

    });

  }


  void searchMeal(String query){


    final suggestions = display.toSet().where((food){
      final foodname = food.name.toLowerCase();
      final input = query.toLowerCase();


      return foodname.contains(input);

    }).toList();

    setState(() {
      display = suggestions;
    });

  }
}

