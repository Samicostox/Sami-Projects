import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nut/Data/physic.dart';
import 'package:provider/provider.dart';

import '../Provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class editphysic extends StatefulWidget {
  const editphysic({Key? key}) : super(key: key);

  @override
  State<editphysic> createState() => _editphysicState();
}

class _editphysicState extends State<editphysic> {

  var url = Uri.parse('http://10.0.2.2:8000/api/physic');
  int idd = 0;

  physic Physic = physic(180, 30, 1, 80, 80,[],[]);
  Future save(int id) async {
    idd = id;

    var res = await http.put(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id' : id,
          'user': id,
          'height' : Physic.height,
          'weight' : Physic.weight,
          'weight_goal' : Physic.weight_goal,
          'duration' : Physic.duration,
          'goal' : Physic.goal

        })
    );

    if(res.statusCode==200) {

      Map info = jsonDecode(res.body) as Map;
      String msg = info['msg'];
      AlertDialog alert = AlertDialog(

        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actions: [
          Lottie.asset('lotties/96237-success.json'),
          TextButton(
            child: Center(child: Text("done",
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



      if(msg == "Your update has been saved !"){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    }
  }

  Future save2(int id) async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id' : id,
        })
    );

    if(res.statusCode==200) {

      Map info = jsonDecode(res.body) as Map;
      Physic.height_list = info['height'];
      print(Physic.height);
      Physic.weight_list = info['weight'];
      Physic.goal = info['goal'];
      Physic.duration = info['duration'];
      Physic.weight_goal = info['weight_goal'];
      Physic.weight = Physic.weight_list.last;
      Physic.height = Physic.height_list.last;

      print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjy");
      print(Physic.weight_goal);


    }

  }

  late final Future myFuture;

  @override
  void initState() {
    myFuture = save2(Provider.of<ID>(context,listen: false).getid());
  }
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: myFuture,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: size.height+20 ,
              width: size.width,
              child: Stack(
                children: [
                  Positioned(
                      top: -20,
                      child: Container(
                        height: 270,
                        width: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Assets/physics.png')
                          )
                        ),

                      )),

                  Positioned(
                    top: 180,
                      left: 120,
                      child: Container(
                        width: 170,
                    height: 47,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                        child: Center(
                          child: Text('Physics',
                          style: TextStyle(
                            color: Color(0xFF35AE2A),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                  ),
                  ),

                  Column(
                    children: [

                      SizedBox(height: 200,),
                      Container(
                        width: size.width,
                        height: size.height/1.32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              SizedBox(height: 90,),
                              Container(

                                width: size.width / 1.1,
                                child: TextFormField(

                                  controller: TextEditingController(
                                      text: (Physic.height.toString()  )),
                                  onChanged: (val){
                                    Physic.height = int.parse(val);
                                  },

                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.edit,
                                    ),
                                    border: OutlineInputBorder(


                                    ),

                                    labelText: 'Height',
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
                              SizedBox(height: 20,),
                              Container(

                                width: size.width / 1.1,
                                child: TextFormField(

                                  controller: TextEditingController(
                                      text: (Physic.weight.toString())),
                                  onChanged: (val){
                                    Physic.weight = int.parse(val);
                                  },

                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.edit,
                                    ),
                                    border: OutlineInputBorder(


                                    ),

                                    labelText: 'Weight',
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
                              SizedBox(height: 20,),
                              Container(

                                width: size.width / 1.1,
                                child: TextFormField(

                                  controller: TextEditingController(
                                      text: Physic.weight_goal.toString() ),
                                  onChanged: (val){
                                    Physic.weight_goal = int.parse(val);
                                  },

                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.edit,
                                    ),
                                    border: OutlineInputBorder(


                                    ),

                                    labelText: 'Weight goal',
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


                              SizedBox(height: 20,),
                              Container(

                                width: size.width / 1.1,
                                child: TextFormField(

                                  controller: TextEditingController(
                                      text: Physic.duration.toString() ),
                                  onChanged: (val){
                                    Physic.duration = int.parse(val);
                                  },


                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.edit,
                                    ),
                                    border: OutlineInputBorder(


                                    ),

                                    labelText: 'Duration (days)',
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

                              SizedBox(height: 30,),


                              Container(
                                width: 150,
                                height: 46,

                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30.0)
                                      ),
                                      primary: Color(0xff086200)
                                  ),
                                  onPressed: () {
                                    save(Provider.of<ID>(context,listen: false).getid());
                                  },
                                  child: Text('Save',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16
                                    ),),


                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 180,
                    left: 120,
                    child: Container(
                      width: 170,
                      height: 47,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text('Physics',
                          style: TextStyle(
                              color: Color(0xFF35AE2A),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),



          );
        },
      ),
    );
  }
}
