import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Data/meal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../Data/Food.dart';
import '../Provider/provider.dart';

class detailfood extends StatefulWidget {
  food_new food;
  detailfood({Key? key, required this.food}) : super(key: key);

  @override
  State<detailfood> createState() => _detailfoodState();
}

class _detailfoodState extends State<detailfood> {
  int price = 0;

  food_new food = food_new("", "", 0, "", ['2.0','2.0','2.0','2.0','2','2','2','2','2','2'], 0, ['2.0','2.0','2.0','2.0','2.0','2.0','','','','','','','','',''], 0, ['','','','','','','','','','','','','','',''], ['15-minutes-or-less','','','','','','easy','','for-large-groups','','','','','','']);

  Widget customcheckbox(List String) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int i = 0; i <= food.ingredients.length - 1; i = i + 1)
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
                food.ingredients[i],
                style: TextStyle(fontFamily: 'Poppins'),
              ),
            ],
          ),
      ],
    );
  }

  Future save() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/onemeal');
    var res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'meal_id': widget.food.id}));
    print('toto');

    if (res.statusCode == 200) {
      //print(res.body);
      Map u = jsonDecode(res.body) as Map;

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

      if(food.tags.length < 9){
        print('tatatatatatat');
        food.tags = ['15-minutes-or-less','','','','','','easy','','for-large-groups','','','','','',''];
      }

      if(food.nutri_values.length < 4){
        print('tatatatatatat');
        food.nutri_values = ['220.00','5.00','12.00','4.00'];
      }

    }
    return food;
  }

  Future rate(double rating) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/rate');
    var res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'meal_id': widget.food.id,
          'user_id': Provider.of<ID>(context,listen: false).getid(),
          'rating' : rating,
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

  Color getColorComplexity(int complexity) {
    //red is just a sample color
    Color color;
    if (complexity <= 4) {
      color = Colors.green;
    } else if (complexity <= 10) {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }



  Color getFatsColor(double fat){
    Color color;
    if (fat <= 3){
      color = Colors.green;
    } else if (fat <= 10){
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  Color getCarbsColor(double carbs){
    Color color;
    if (carbs <= 10){
      color = Colors.green;
    } else if (carbs <= 25){
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  Color getProteinColor(double protein){
    Color color;
    if (protein <= 15){
      color = Colors.green;
    } else if (protein <= 40){
      color = Colors.orange;
    } else {
      color = Colors.red;
    }
    return color;
  }

  double getPercent(double value){
    double answer;
    if (value <= 33){
      answer = value*3;
    }else{
      answer = 100;
    }
    return answer/100;
  }

  double getComplexityvalue(int n_steps){
    double value;
    if (n_steps <= 4){
      value = 25;
    }else if(n_steps <= 8){
      value = 50;
    }else if(n_steps <= 13) {
      value = 75;
    }else {
      value = 100;
    }
    return value/100;
  }

  double getPricevalue(int ingredients){
    double value;
    if (ingredients <= 4){
      value = 25;
    }else if(ingredients <= 8){
      value = 50;
    }else if(ingredients <= 13) {
      value = 75;
    }else {
      value = 100;
    }
    return value/100;
  }

  Color getColorPrice(int Price) {
    //red is just a sample color
    Color color;
    print(Price);
    if (Price <= 4) {
      color = Colors.green;

    } else if (Price <= 8) {
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
        child: FutureBuilder(
            future: save(),
            builder: (context, snapshot) {

    if (snapshot.data == null) {
    return Center(child: Container(
    width: 100,
    height: 100,
    child: Lottie.asset('lotties/loading-blue.json')));
    } else {
      return Column(
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
                      food.name.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF086200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            food.tags[0],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 11),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF086200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            food.tags[6],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 11),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF086200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            food.tags[8],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 11),
                          ),
                        ),
                      )
                    ],
                  )
                ],
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
                    percent: getComplexityvalue(food.n_steps),
                    barRadius: const Radius.circular(16),
                    backgroundColor: Color(0xffE6E6E6),
                    progressColor: getColorComplexity(food.n_steps),
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
                    percent: getPricevalue(food.ingredients.length),
                    barRadius: const Radius.circular(16),
                    backgroundColor: Color(0xffE6E6E6),
                    progressColor: getColorPrice(food.ingredients.length),
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
                    SizedBox(width: 80,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 17, 0, 0),
                      child: Text('Calories :  ', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                      child: Text(widget.food.nutri_values[0], style: TextStyle(
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
                      getPercent(double.parse(food.nutri_values[1])),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: getFatsColor(
                          double.parse(food.nutri_values[1])),
                      center: new Text(
                        food.nutri_values[1] + "g",
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
                      getPercent(double.parse(food.nutri_values[2])),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: getCarbsColor(
                          double.parse(food.nutri_values[2])),
                      center: new Text(
                        food.nutri_values[2] + "g",
                        style: new TextStyle(
                            fontSize: 16.0, fontFamily: 'Poppins'),
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: new Text(
                          "Sugar ",
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
                      getPercent(double.parse(food.nutri_values[3])),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: getCarbsColor(
                          double.parse(food.nutri_values[3])),
                      center: new Text(
                        food.nutri_values[3] + "g",
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
          customcheckbox(food.ingredients),
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
                      food.description,
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Recipe',
                    style:
                    TextStyle(fontFamily: 'Poppins', fontSize: 24),
                  ),
                ),
                Container(
                  width: size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                    child: Text(
                      food.steps.join(', '),
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 120,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                Text('Rate this meal',
                  style: TextStyle(
                      fontSize: 18
                  ),),
                SizedBox(height: 20,),
                Container(


                  child: RatingBar.builder(
                    itemSize: 40.0,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      rate(rating);
                      print('toto');
                    },
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 50,)
        ],
      );
    }
            }),
      ),
    );
  }
}
