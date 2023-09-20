
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Pages/firstrating.dart';
import 'package:nut/login/reg.dart';
import 'dart:convert';

import 'package:nut/login/userlog.dart';
import 'package:provider/provider.dart';

import '../Provider/home2.dart';
import '../Provider/provider.dart';
import '../home.dart';
import 'background.dart';





class UserModel{
  String token;
  String uuid;
  UserModel(this.token, this.uuid);
}

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  User user = User("","");
  UserModel userr = UserModel("","");
  String uuid="";
  String token="";
  String msg= "";

  Future save() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/login');
      var res = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8',},
          body: json.encode({
            'email': user.username,//user.username,//'Test2',//user.username,
            'password': user.password,//user.password,//'123Abc!2',//user.password,
          })
      );
      //print(user.username);
      //print(user.password);
      //print(res.body);
      if(res.statusCode==200) {
        //print(res.body);
        Map info = jsonDecode(res.body) as Map;

        String msg = info['msg'];
        int uuid = info['detail'];
        String name = info['name'];
        Uint8List image = base64Decode(info["image"]);


        AlertDialog alert = AlertDialog(

          content: Text(
            msg,
            textAlign: TextAlign.center,
          ),
          actions: [
            Lottie.asset('lotties/fail.json'),
            TextButton(
              child: Center(child: Text("Cancel",
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
        ///////////////////////////////////////////////////////////// change this part later ///////////////////////////////////////////////
        if (msg == 'User not found !' || msg == 'Incorrect password !' || msg == 'user did not validate email') {
          print("totvdedvdvo");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        } else {
          print('test');
          Provider.of<ID>(context,listen: false).setID(uuid);
          Provider.of<ID>(context,listen: false).setName(name);
          Provider.of<ID>(context,listen: false).setImage(image);
          if (msg == 'go to rating'){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => firstrating()));


          } else {
            print(msg);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => home(i: 2)));
          }

        }

      }
    }catch(e){
      print('caught error2:  $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      color : Color(0xFF086200),
                      fontFamily: 'Poppins',
                      fontSize: 36
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  controller: TextEditingController(text: user.username),
                  onChanged: (val){
                    user.username = val;
                  },
                  validator: (value){
                    if (value == ""){
                      return 'username is Empty';
                    }
                    return null;
                  },
                ),
              ),


              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  controller: TextEditingController(text: user.password),
                  onChanged: (val){
                    user.password = val;
                  },
                  validator: (value){
                    if (value == ""){
                      return 'password is Empty';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,


                  ),
                  obscureText: true,
                ),
              ),


              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.05),

              Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                child: Container(

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(

                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))

                      ),

                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await Future.delayed(Duration(seconds: 1), () {
                          save();
                        });
                      }

                    },

                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:
                          const LinearGradient(colors: [Color(0xFF35AE2A),
                            Color(0xFF086200),]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: size.width/1.8,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Log In',
                          style:
                          const TextStyle(fontSize: 19, ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                  },
                  child: Text(
                    "Don't Have an Account? Sign up",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',

                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

