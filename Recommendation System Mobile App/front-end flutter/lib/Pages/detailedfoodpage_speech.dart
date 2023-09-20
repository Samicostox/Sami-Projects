import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Data/meal.dart';
import 'package:nut/Data/speech.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../Data/Food.dart';
import '../Provider/provider.dart';

class detailfood_speech extends StatefulWidget {
  speech food;
  detailfood_speech({Key? key, required this.food}) : super(key: key);

  @override
  State<detailfood_speech> createState() => _detailfood_speechState();
}

class _detailfood_speechState extends State<detailfood_speech> {
  int price = 0;



 Widget customcheckbox(List ingredients) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int i = 0; i <= ingredients.length - 1; i = i + 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: Color(0xFF35AE2A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                value: ischeckbox[i],
                onChanged: (bool? value) {
                  setState(() {
                    ischeckbox[i] = value!;
                  });
                },
              ),
              Text(
                ingredients[i],
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ],
          ),
      ],
    );
  }






  Color getColorComplexity(int complexity) {
    //red is just a sample color
    Color color;
    if (complexity == 1) {
      color = Colors.green;
    } else if (complexity == 2) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  Color getColorPrice(int Price) {
    //red is just a sample color
    Color color;
    if (price <= 33) {
      color = Colors.green;
    } else if (price <= 66) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  List<bool> ischeckbox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  double _currentSliderValue = 20;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(1, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              widget.food.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Poppins',
                                  color: Colors.black),
                            ),
                          ),
  ]
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 170,
                        width: 170,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.network(
                              widget.food.imageurl,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Health',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            width: 180.0,
                            lineHeight: 9.0,
                            percent: 0.5,
                            barRadius: const Radius.circular(16),
                            backgroundColor: Color(0xffE6E6E6),
                            progressColor: Colors.orange,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Complexity',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            width: 180.0,
                            lineHeight: 9.0,
                            percent: 80 / 100,
                            barRadius: const Radius.circular(16),
                            backgroundColor: Color(0xffE6E6E6),
                            progressColor: getColorComplexity(10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            width: 180.0,
                            lineHeight: 9.0,
                            percent: 1 / 100,
                            barRadius: const Radius.circular(16),
                            backgroundColor: Color(0xffE6E6E6),
                            progressColor: getColorPrice(price),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 192,
                    width: 388,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(1, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 17, 0, 0),
                              child: Text(
                                'Nutrional Values',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 100,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                              child: Text('Calories :  ',style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                              child: Text(widget.food.nutri_values[0],style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 40,
                              lineWidth: 8.0,
                              percent:
                              double.parse(widget.food.nutri_values[1]) / 50,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.green,
                              center: new Text(
                                widget.food.nutri_values[1] + "g",
                                style: new TextStyle(
                                    fontSize: 16.0, fontFamily: 'Poppins'),
                              ),
                              footer: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: new Text(
                                  "Fats ",
                                  style: new TextStyle(
                                      fontSize: 16.0, fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            CircularPercentIndicator(
                              radius: 40,
                              lineWidth: 8.0,
                              percent:
                              double.parse(widget.food.nutri_values[2]) / 50,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: new Text(
                                widget.food.nutri_values[2] + "g",
                                style: new TextStyle(
                                    fontSize: 16.0, fontFamily: 'Poppins'),
                              ),
                              footer: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: new Text(
                                  "Carbs ",
                                  style: new TextStyle(
                                      fontSize: 16.0, fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            CircularPercentIndicator(
                              radius: 40,
                              lineWidth: 8.0,
                              percent:
                              double.parse(widget.food.nutri_values[3]) / 50,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.green,
                              center: new Text(
                                widget.food.nutri_values[3] + "g",
                                style: new TextStyle(
                                    fontSize: 16.0, fontFamily: 'Poppins'),
                              ),
                              footer: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: new Text(
                                  "Protein ",
                                  style: new TextStyle(
                                      fontSize: 16.0, fontFamily: 'Poppins'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),



                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Ingredients',
                            style:
                            TextStyle(fontFamily: 'Poppins', fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customcheckbox(widget.food.ingredients),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Description',
                            style:
                            TextStyle(fontFamily: 'Poppins', fontSize: 24),
                          ),
                        ),
                        Container(
                          width: size.width / 1.1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                            child: Text(
                              widget.food.description,
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                  SizedBox(height: 50,)
                ],
              ),

      ),
    );
  }
}
