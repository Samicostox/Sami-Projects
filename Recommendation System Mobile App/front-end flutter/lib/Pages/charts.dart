import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/chart_data.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../Provider/provider.dart';


class charts extends StatefulWidget {
  const charts({super.key});


  @override
  State<charts> createState() => _chartsState();
}

class _chartsState extends State<charts> {
  List<FlSpot> fl = [];
  List<FlSpot> fl5 = [];
  List<FlSpot> fl7 = [];
  double BMI = 0;
  double calories = 0;
  List<Color> gradientColors = [
    const Color(0xFF086200),
    const Color(0xFF35AE2A),
  ];

  bool showAvg = false;
  int i = 0;



  var url = Uri.parse('http://10.0.2.2:8000/api/charts');

  chartdata profile = chartdata([1], [1], [1], [1], [1],[],0,0,0);

  Future save() async {
    print(Provider.of<ID>(context,listen: false).getid());



    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id': Provider.of<ID>(context,listen: false).getid(),
        })
    );
    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body) as Map;

      profile.height = data['physic_height'];
      profile.weight = data['physic_weight'];
      profile.weight_days = data['weight_days'];
      profile.height_days = data['height_days'];


      profile.list_weight = data['list'];
      print('allgood');
      profile.weight_goal = data['weight_goal'];
      print('allgood');
      profile.duration = data['duration'];
      profile.age = data['age'];
      print(profile.age);
      print('allgood');

      int weight = profile.weight.last;
      print(weight);
      double height = profile.height.last/100;
      int age = profile.age;
      double height_squared = (profile.height.last/100)*(profile.height.last/100);
      print(height_squared);
      BMI = weight/height_squared;


      if(weight < profile.weight_goal){
        calories = 13.7*weight + 500*height - 6.777*age + 66 + 200;
      }else if (weight > profile.weight_goal){
        calories = 13.7*weight + 500*height - 6.777*age + 66 - 200;
      }else{
        calories = 13.7*weight + 500*height - 6.777*age + 66;
      }












      print(profile.weight);
      print('f');

      for (var i = 0; i < profile.weight.length; i++) {
        print('ffff');
        print(profile.weight[i]);
        print(profile.weight_days[i]);
        int temp1 = profile.weight[i];
        int temp2 = profile.weight_days[i];
        print('ffff');

        int temp3 = profile.height[i];
        int temp4 = profile.height_days[i];


        print('test1');

        int sub = profile.weight_days[0];

        fl.add(FlSpot(sub - temp2.toDouble(),temp1.toDouble()));
        fl7.add(FlSpot(sub - temp2.toDouble(),temp1.toDouble()));
        fl5.add(FlSpot(temp4.toDouble(), temp3.toDouble()));


        print('tata');


      }
      print('tamere');
      print(fl5);


      print(fl);
      int a = profile.weight_days[0];
      int temp5 = profile.weight_goal ;
      int temp6 = profile.duration;
      fl7.reversed;

      fl7.add(FlSpot(temp6.toDouble() + a,temp5.toDouble()));

      print(fl);
      print('spacer');
      print(fl7);










    }
    return profile;
  }
  late final Future myFuture;
  @override
  void initState() {
   
    myFuture = save();
    print('HHHHHHHHHHHHHHHHHHHHHHHHHHH');







  }






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future : myFuture,
        builder: (context, snapshot) {

          if (snapshot.data == null) {
            return Center(child: Container(
                width: 100,
                height: 100,
                child: Lottie.asset('lotties/loading-blue.json')));
          } else {
            return SingleChildScrollView(
              child: Stack(
                children: [


                  Column(

                    children: [


                      Container(
                        width: size.width,
                        height: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Assets/analytics.jpg'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 180,
                              left: 120,

                              child: Container(
                                width: 170,
                                height: 47,

                                decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text('Charts',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF086200)
                                    ),),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 50,),

                      Container(
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

                        width: size.width / 1.05,
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('Weight Evolution',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(profile.weight.last.toString() + ' kg',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontFamily: 'Poppins'
                                      ),
                                    ),
                                    Text('Weight ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: ''
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Column(
                                  children: [

                                    Text(BMI.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontFamily: 'Poppins'
                                      ),
                                    ),
                                    Text('BMI ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: ''
                                      ),
                                    ),


                                  ],
                                ),
                                Container(
                                  height: 100,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Column(
                                  children: [

                                    Text(calories.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontFamily: 'Poppins'
                                      ),
                                    ),
                                    Text('Calories Intake ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: ''
                                      ),
                                    ),


                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),


                      SizedBox(height: 20,),
                      Container(

                        child: Stack(


                          children: <Widget>[

                            AspectRatio(

                              aspectRatio: 1.30,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  color: Color(0xff232d37),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 18,
                                    left: 12,
                                    top: 24,
                                    bottom: 12,
                                  ),
                                  child: LineChart(
                                    showAvg ? mainData(fl7) : mainData(fl),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Center(child: Text(
                                showAvg ? 'Weight Goal' : 'Weight Evolution',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins'
                                ),)),
                            ),
                            SizedBox(
                              width: 60,
                              height: 34,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showAvg = !showAvg;
                                  });
                                },
                                child: Text(
                                  showAvg ? 'Weight' : 'goal',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: showAvg ? Colors.white.withOpacity(
                                        0.5) : Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 20,),


                    ],
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {

      case 90:
        text = const Text('3 month', style: style);
        break;
      case 180:
        text = const Text('6 month', style: style);
        break;
      case 270:
        text = const Text('9 month', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0kg';
        break;
      case 30:
        text = '30kg';
        break;
      case 60:
        text = '60kg';
        break;
      case 90:
        text = '90kg';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget leftTitleWidgets2(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0cm';
        break;
      case 50:
        text = '50cm';
        break;
      case 100:
        text = '100cm';
        break;
      case 150:
        text = '150cm';
        break;
      case 200:
        text = '200cm';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
  LineChartData mainData2(List<FlSpot> fl3) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 365,
      minY: 0,
      maxY: 120,
      lineBarsData: [
        LineChartBarData(
          spots: fl3 ,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(List<FlSpot> fl3) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 365,
      minY: 0,
      maxY: 120,
      lineBarsData: [
        LineChartBarData(
          spots: fl3 ,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData(List<FlSpot> fl4) {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets2,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 365,
      minY: 0,
      maxY: 220,
      lineBarsData: [
        LineChartBarData(
          spots: fl4,
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
