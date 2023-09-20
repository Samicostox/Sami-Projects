import 'dart:io';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Pages/detailfoodpage.dart';
import 'package:provider/provider.dart';

import 'dart:convert';


import '../Data/Food.dart';
import '../Provider/home2.dart';
import '../Provider/provider.dart';
import '../home.dart';

class fpfirstrating extends StatefulWidget {

  food_new food;


  fpfirstrating({Key? key, required this.food}) : super(key: key);

  @override
  State<fpfirstrating> createState() => _fpfirstratingState();
}

class _fpfirstratingState extends State<fpfirstrating> {


  Future rate() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/firstrating');
    var res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'meal_id': widget.food.id,
          'user_id': Provider.of<ID>(context,listen: false).getid(),
          'rating' : 5,
        }));
    print('toto');

    if (res.statusCode == 200) {
      //print(res.body);
      Map data = jsonDecode(res.body) as Map;
      String msg = data['msg'];
      AlertDialog alert = AlertDialog(

        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actions: [
          Lottie.asset('lotties/rate.json'),
          TextButton(
            child: Center(child: Text("Done",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xFF35AE2A)
              ),)),
            onPressed:  () {
              Navigator.of(context).pop();
            },
          )
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );


    }
  }


  String getFaceComplexity() {
    //red is just a sample color
    String face;
    if (widget.food.n_steps <= 7) {
      face = "😊";
    } else if (widget.food.n_steps <= 13) {
      face = "😐";
    } else {
      face = "🥵";
    }
    return face;
  }

  String getFaceHealth() {
    //red is just a sample color
    String face;
    if (double.parse(widget.food.nutri_values[0]) <= 200.00) {
      face = "😊";
    } else if (double.parse(widget.food.nutri_values[0]) <= 400.00) {
      face = "😐";
    } else {
      face = "🤢";
    }
    return face;
  }


  String getBudget(int ingredients){
    String value;
    if (ingredients <= 4){
      value = "£";
    }else if(ingredients <= 8){
      value = "££";
    }else if(ingredients <= 13) {
      value = "£££";
    }else {
      value = "££££ 🥵";
    }
    return value;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var padtop = size.height/100;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [


          Column(
            children: [



              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white,
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0)
                  ),

                ),
                onPressed: () {

                  rate();

                  sleep(Duration(seconds: 1));



                  Navigator.push(context, MaterialPageRoute(builder: (context) => home(i:2)));

                  print(widget.food.id);},
                child: Container(
                  height: 120,
                  width: size.width/1.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          height: 120,
                          width: 100,

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(widget.food.imageurl,fit: BoxFit.fill,)),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            width: 230,
                            child: Text(widget.food.name.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          SizedBox(height: 9,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Budget : ' + getBudget(widget.food.ingredients.length),
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Color(0xFF808080)

                              ),
                            ),
                          ),


                        ],
                      )



                    ],
                  ),
                ),
              )

            ],
          ),
          Positioned(
              left: 120,
              top: 100,
              child: Container(

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),

                height: 27,
                width: 125,
                child: Center(child: Text('Complexity ' + getFaceComplexity(),
                  style: TextStyle(
                    fontFamily: 'Poppins',

                  ),)),
              )),

          Positioned(
              left: 270,
              top: 100,
              child: Container(

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),

                height: 27,
                width: 85,
                child: Center(child: Text('Health ' + getFaceHealth(),
                  style: TextStyle(
                    fontFamily: 'Poppins',

                  ),)),
              )),

        ],

      ),
    );
  }



}
