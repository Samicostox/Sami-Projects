import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nut/Data/workout_data.dart';
import 'package:nut/Pages/workout_box.dart';
import 'package:provider/provider.dart';
import '../Provider/home2.dart';
import '../Provider/provider.dart';
import 'package:http/http.dart' as http;

class workoutpage extends StatefulWidget {
  const workoutpage({Key? key}) : super(key: key);

  @override
  State<workoutpage> createState() => _workoutpageState();
}

class _workoutpageState extends State<workoutpage> {
  int i = 0;
  int prout = 0;




  workout_data workout = workout_data([], []);

  var url = Uri.parse('http://10.0.2.2:8000/api/workout');

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id': Provider.of<ID>(context,listen: false).getid(),
          //user.username,//'Test2',//user.username,

        })

    );
    print('avant code 20000');
    if (res.statusCode == 200) {
      print('test');
      Map data = jsonDecode(res.body) as Map;

      workout.name = data['workout_names'];
      workout.workout = data['workout_list'];

      print(workout.name);
      print(workout.workout);
      print(workout.workout[0].length);

      prout = workout.workout[0].length;


      
      print(workout.name);

      List list = workout.workout;

      workout.workout = list.map((innerList) {
        return innerList.where((element) => element != 'None').toList();
      }).toList();

      print('test');




      // don't forget in the futur to add bet_request_id


    }
  }
  var url2 = Uri.parse('http://10.0.2.2:8000/api/openai_sports');

  Future save2() async {
    var res = await http.post(url2,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id':Provider.of<ID>(context,listen: false).getid(),
          'nbr_workout' : nbworout,
          //user.username,//'Test2',//user.username,

        })

    );
    print('avant code 20000');
    if (res.statusCode == 200) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => home(i:3)));



    }
  }

  int nbworout = 0;
  late final Future myFuture;
  @override
  void initState() {

    myFuture = save();





  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(

          future: myFuture,
          builder: (context, snapshot) {
            if (workout.name.isEmpty) {
              return Center(child: Container(
                height: 1000,
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text('Generate a Program based on your profile !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 30,

                    ),),
                    SizedBox(height: 200,),
                    Container(

                      width: size.width / 1.1,
                      child: TextFormField(

                        controller: TextEditingController(
                            text: ("")),
                        onChanged: (val){
                          nbworout = int.parse(val);
                        },

                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                          ),
                          border: OutlineInputBorder(


                          ),

                          labelText: 'Number of workout',
                          labelStyle: TextStyle(

                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),),
                            borderSide: BorderSide(
                              color: Color(0xffE7E7E7),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 250,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0)
                            ),
                            primary: Color(0xff086200)
                        ),
                        onPressed: (){
                          print(nbworout);
                          save2();
                          showDialog(context: context,
                              builder: (BuildContext context) =>
                                  SimpleDialog(
                                      title: const Text(
                                        'Generating you a Program .......',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),

                                      children: <Widget>[
                                        Lottie.asset('lotties/loading-blue.json'),
                                      ]


                                  ));


                        },

                        child: Text('Generate Program',
                        style: TextStyle(
                          fontSize: 25
                        ),),
                      ),
                    ),
                  ],
                ),

              ));
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Assets/workout2.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none ,
                        children: [
                          Positioned(
                            top: 120,
                            left: 55,

                            child: Container(
                              width: 300,
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
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text('Workout Program',
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
                    SizedBox(height: 30,),
                    IntrinsicHeight(
                      child: Container(
                        height: (prout*70 + 200),
                        width: 1000,
                        child: ListView.builder(



                          // This next line does the trick.
                            scrollDirection: Axis.horizontal,


                            physics: PageScrollPhysics(),

                            itemCount: workout.name.length,
                            itemBuilder: (BuildContext context, int index) {
                              return workout_box(work: workout.workout[index],
                                name: workout.name[index],);
                            }
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(

                      width: size.width / 1.1,
                      child: TextFormField(

                        controller: TextEditingController(
                            text: ("")),
                        onChanged: (val){
                          nbworout = int.parse(val);
                        },

                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.edit,
                          ),
                          border: OutlineInputBorder(


                          ),

                          labelText: 'Number of workout',
                          labelStyle: TextStyle(

                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),),
                            borderSide: BorderSide(
                              color: Color(0xffE7E7E7),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width: 250,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0)
                            ),
                            primary: Color(0xff086200)
                        ),
                        onPressed: (){
                          print(nbworout);
                          save2();
                          showDialog(context: context,
                              builder: (BuildContext context) =>
                                  SimpleDialog(
                                      title: const Text(
                                        'Generating you a Program .......',
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),

                                      children: <Widget>[
                                        Lottie.asset('lotties/loading-blue.json'),
                                      ]


                                  ));


                        },

                        child: Text('Regenerate Program',
                          style: TextStyle(
                              fontSize: 22
                          ),),
                      ),
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              );
            }
          }
      ),

    );
  }

}