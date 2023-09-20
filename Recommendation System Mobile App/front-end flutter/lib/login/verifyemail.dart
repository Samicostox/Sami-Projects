import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'background.dart';
import 'dart:convert';

import 'log.dart';
class verifyemail extends StatefulWidget {

  int id;
  verifyemail({Key? key,  required this.id }) : super(key: key);

  @override
  State<verifyemail> createState() => _verifyemailState();
}

class _verifyemailState extends State<verifyemail> {
  int usercode = 0;
  TextEditingController codee = TextEditingController();

  var url = Uri.parse('http://10.0.2.2:8000/api/emailPage');

  Future save() async{

    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'userid' : widget.id,
          'code' : usercode


        })
    );
    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body) as Map;
      String msg = data['msg'];

      AlertDialog alert = AlertDialog(

        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),

        actions: [
          Lottie.asset('lotties/fail.json'),

          TextButton(
            child: Center(child: Text("Cancel")),
            onPressed:  () {
              Navigator.of(context).pop();
            },
          ),






        ],


      );



      AlertDialog alert2 = AlertDialog(

        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actions: [
          Lottie.asset('lotties/96237-success.json'),
          TextButton(
            child: Center(child: Text("Continue")),
            onPressed:  () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      );

      if (msg == "Email Verified Successfully"){

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert2;
          },
        );
      } else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );

      }
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            SizedBox(height: size.height/2.6 ),
            Text('Please enter the code sent to your email adress',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,

              ),),
            SizedBox(height: size.height/15 ),
            Container(
              alignment: Alignment.topLeft,
              width: size.width - 80,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter your code here',
                    labelStyle: TextStyle(
                      color:  Color(0xFF963096),
                    ),
                    fillColor:  Color(0xFF963096),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color:  Color(0xFF963096),
                      ),

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color:  Colors.grey,
                      )
                      ,
                    )
                ),
                keyboardType: TextInputType.number,

                controller: codee,
                onChanged: (val){
                  usercode = int.parse(codee.text);
                },

              ),
            ),
          ],
        )
        ,),
      floatingActionButton : FloatingActionButton(

        onPressed: (){

          save();

        },
        child: Icon(Icons.check),
        backgroundColor:Color(0xFF963096) ,



      ),

    );
  }
}

