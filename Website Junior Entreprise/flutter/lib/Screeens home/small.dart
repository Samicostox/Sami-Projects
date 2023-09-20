import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';


import 'package:http/http.dart' as http;

import '../backgrounds/backmain.dart';
import '../data/email.dart';
import '../widget/buttonHover.dart';
import '../widget/card.dart';
class small extends StatefulWidget {
  const small({Key? key}) : super(key: key);

  @override
  State<small> createState() => _smallState();
}

class _smallState extends State<small> {


  ScrollController controllerOne = ScrollController();



  @override
  void initState() {
    controllerOne = ScrollController();

    super.initState();
  }
  sendEmail info = sendEmail('', '', '', '');

  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');


  Future save() async {
    print('toto');
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'service_id': 'service_arfs545',
          'template_id': 'template_ry1jdhd',
          'user_id': '0jPttbRmdO2fMh_tY',
          'template_params':{
            'user_name': info.name,
            'user_email' : info.email,
            'user_subject' : info.subject,
            'user_message' : info.message
          },


        })
    );
  }
  late bool showBorder = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double pw = (size.width/80);
    return SingleChildScrollView(
      child: backmain(
        child: Container(



          child: Column(
            children: [



              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 100,),

                  Padding(

                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Image(image: AssetImage('Assets/logo3.png'),),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
                    child: buttonHover(title: 'Home',controller: controllerOne,position: 21),

                  ),
                  SizedBox(width: size.width/30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
                    child: buttonHover(title: 'About us',controller: controllerOne,position: 1000),
                  ),
                  SizedBox(width: size.width/30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
                    child: buttonHover(title: 'Services',controller: controllerOne,position: 2000),
                  ),
                  SizedBox(width: size.width/30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 29, 0, 0),
                    child: buttonHover(title: 'Connect',controller: controllerOne,position: 3000),
                  ),









                ],
              ),
              SizedBox(height: 140,),
              Row(





                children: [
                  SizedBox(width: size.width/13,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                        width: 700,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                          child: Text('The key to unlocking your ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w200,
                              decoration: TextDecoration.none,







                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 700,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                          child: Text('University & Company',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF98BDD8),
                              fontSize: 75,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,






                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30,),

                      Container(
                        width: 600,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                          child: Text('We help you realize your digital business with software that suit your business  ',
                            style: TextStyle(
                              color: Colors.black,

                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              decoration: TextDecoration.none,






                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),

                      Container(
                        height: 44.0,
                        width: 240,
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF98BDD8), Color(0xFFAEBDD8)]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),

                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                          child: Text('Get Started',
                            style: TextStyle(
                              fontSize: 20,
                            ),

                          ),
                        ),
                      ),

                      SizedBox(height: 200),







                    ],



                  ),








                ],

              ),

              Column(
                children: [
                  Container(

                    child: Center(child: Text('About us?',
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,






                      ),
                    ),
                    ),


                  ),
                  SizedBox(height: 8,),


                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF98BDD8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 110,
                    height: 5,

                  ),

                  SizedBox(height : 70),



                  Center(
                    child: Container(
                      width: size.width/2,
                      child: Text('UoB Junior Solutions is a consulting firm that is run by University of Birmingham students. We provide digital solutions, data analytics and strategy services to individuals, small and medium companies, as well as institutions. Through the provision of these high quality services at competitive prices, we aim to aid and facilitate start-ups in their development.',
                        style :TextStyle(
                          color: Colors.black,

                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          decoration: TextDecoration.none,
                          letterSpacing: 0,
                          height: 1.3,








                        ),
                        textAlign: TextAlign.center,),
                    ),
                  ),
                  SizedBox(height: 70,),


                  Container(
                    height: 44.0,
                    width: 240,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF98BDD8), Color(0xFFAEBDD8)]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),



                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                      child: Text('Read more',
                        style: TextStyle(
                          fontSize: 20,
                        ),

                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 180,),
              Column(
                children: [

                  Container(

                    child: Center(child: Text('Our Services',
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,






                      ),
                    ),
                    ),


                  ),

                  SizedBox(height: 8,),


                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF98BDD8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 110,
                    height: 5,

                  ),

                  SizedBox(height: 30,),


                  Center(
                    child: Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children: [
                          card(s: 'Mobile Development', i: 'Assets/waves.png',c1:Color(0xffC9D6FF),c2:Color(0xffE2E2E2)),
                          SizedBox(width: 100,),
                          card(s: 'Web Development',i: 'Assets/lines.png',c1:Color(0xffD66D75),c2:Color(0xffE29587)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 70,),

                  Center(
                    child: Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children: [
                          card(s: 'Data',i: 'Assets/lines.png',c1:Color(0xffAAFFA9),c2:Color(0xff11FFBD)),
                          SizedBox(width: 100,),
                          card(s: 'Strategy', i: 'Assets/waves.png',c1:Color(
                              0xffa2a6a2),c2:Color(0xff000C40)),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 150,),
              Column(
                children: [
                  Container(

                    child: Center(child: Text('A question ?',
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: 50,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,






                      ),
                    ),
                    ),


                  ),
                  SizedBox(height: 8,),
                  Text('Do not hesitate to contact us !',
                    style: TextStyle(
                      color: Colors.grey[700],

                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),),

                  SizedBox(height: 14,),


                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF98BDD8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: 110,
                    height: 5,

                  ),

                  SizedBox(height: 100,),

                  Card(
                    color: Colors.white,
                    elevation: 20,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SizedBox(
                      width: 1400,
                      height: 600,
                      child:
                      Center(child:

                      Column(
                        children: [

                          SizedBox(height: 50),

                          Row(
                            children: [
                              SizedBox(width: 80,),
                              Container(
                                height: 70,
                                width: 600,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: TextEditingController(text: info.name),
                                  onChanged: (val){
                                    info.name = val;
                                  },

                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Name',

                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.grey[200]
                                  ),
                                ),
                              ),
                              SizedBox(width: 40,),
                              Container(
                                height: 70,
                                width: 600,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: TextEditingController(text: info.email),
                                  onChanged: (val){
                                    info.email = val;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Email',

                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.grey[200]
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 0,),
                          Row(
                            children: [
                              SizedBox(width: 80,),
                              Container(
                                height: 70,
                                width: 600,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  // controller: searchCtrl,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Company',

                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.grey[200]
                                  ),
                                ),
                              ),
                              SizedBox(width: 40,),
                              Container(
                                height: 70,
                                width: 600,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller: TextEditingController(text: info.subject),
                                  onChanged: (val){
                                    info.subject = val;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Subject',

                                      hintStyle: TextStyle(fontSize: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      contentPadding: EdgeInsets.all(16),
                                      fillColor: Colors.grey[200]
                                  ),
                                ),
                              ),

                            ],
                          ),

                          Container(
                            height: 300,
                            width: 1240,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              controller: TextEditingController(text: info.message),
                              onChanged: (val){
                                info.message = val;
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: 30,


                              decoration: InputDecoration(
                                  hintText: 'Message',

                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(16),
                                  fillColor: Colors.grey[200]
                              ),
                            ),
                          ),




                          SizedBox(height: 30,),

                          Container(
                            height: 44.0,
                            width: 240,
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF98BDD8), Color(0xFFAEBDD8)]),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),

                            child: ElevatedButton(
                              onPressed: () {
                                save();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => small()));
                                print(info.name);
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                              child: Text('Send',
                                style: TextStyle(
                                  fontSize: 20,
                                ),

                              ),
                            ),
                          ),




                        ],
                      )),
                    ),
                  )

                ],


              ),

              SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UoB',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.none,

                          ),
                        ),
                        SizedBox(height: 50,),

                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style :TextStyle(
                            color: Colors.black,

                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            letterSpacing: 0,
                            height: 2,








                          ),
                        ),


                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.none,

                          ),
                        ),
                        SizedBox(height: 50,),

                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style :TextStyle(
                            color: Colors.black,

                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            letterSpacing: 0,
                            height: 2,








                          ),
                        ),


                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Useful Link',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.none,

                          ),
                        ),
                        SizedBox(height: 50,),

                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style :TextStyle(
                            color: Colors.black,

                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            letterSpacing: 0,
                            height: 2,








                          ),
                        ),


                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Stay Connected',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.none,

                          ),
                        ),
                        SizedBox(height: 50,),

                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                          style :TextStyle(
                            color: Colors.black,

                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            decoration: TextDecoration.none,
                            letterSpacing: 0,
                            height: 2,








                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              )


            ],
          ),


        ),
      ),
    );
  }
}
