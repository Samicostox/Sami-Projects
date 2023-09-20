import 'dart:convert';
import 'dart:html';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:je_website/backgrounds/backmain2.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:math';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:je_website/widget/popup.dart';

import '../backgrounds/backmain.dart';
import '../data/email.dart';
import '../widget/buttonHover.dart';
import '../widget/card.dart';
import '../widget/card2.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(
    title: 'Home',
    icon: Icons.home,
  ),
  CustomPopupMenu(
    title: 'Abous Us',
    icon: Icons.bookmark,
  ),
  CustomPopupMenu(
    title: 'Services',
    icon: Icons.settings,
  ),
  CustomPopupMenu(
    title: 'Contact',
    icon: Icons.settings,
  ),
];

class _PhoneState extends State<Phone> {
  final _formKey = GlobalKey<FormState>();

  AlertDialog alerte(context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 300,
        child: Column(
          children: [
            Lottie.asset('lotties/email.json'),
            Container(
              child: Text(
                'Thank you for contacting us!',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Container(
              height: 44.0,
              width: 240,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF98BDD8), Color(0xFFAEBDD8)]),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ScrollController controllerOne = ScrollController();

  @override
  void initState() {
    controllerOne = ScrollController();

    super.initState();
  }

  sendEmail info = sendEmail('', '', '', '');

  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  CustomPopupMenu _selectedChoices = choices[0];
  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  Future save() async {
    print('toto');
    var res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'service_id': 'service_arfs545',
          'template_id': 'template_ry1jdhd',
          'user_id': '0jPttbRmdO2fMh_tY',
          'template_params': {
            'user_name': info.name,
            'user_email': info.email,
            'user_subject': info.subject,
            'user_message': info.message
          },
        }));
  }

  late bool showBorder = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double pw = (size.width / 80);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Transform(
          transform: Matrix4.translationValues(-60.0, 0.0, 0.0),
          child: Image.asset(
            'Assets/logo2sansback.png',
            width: 300,
            height: 100,
          ),
        ),
        actions: [
          PopupMenuButton<CustomPopupMenu>(
            child: Icon(
              FontAwesomeIcons.navicon,
              color: Colors.black,
            ),
            elevation: 3.2,
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: (value) {
              if (value == choices[0]) {
                controllerOne.animateTo(
                  71,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.ease,
                );
              } else if (value == choices[1]) {
                controllerOne.animateTo(
                  751,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.ease,
                );
              } else if (value == choices[2]) {
                controllerOne.animateTo(
                  1500,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.ease,
                );
              } else if (value == choices[3]) {
                controllerOne.animateTo(
                  4050,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.ease,
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
          Container(
            width: (50),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: controllerOne,
        child: backmain2(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Container(
                    height: 520,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width / 13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width / 1.2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                                child: Text(
                                  'Bridging the gap between ',
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
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: size.width / 1.2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Text(
                                  'University & Industry',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF98BDD8), // try this blue
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            Container(
                              width: size.width / 1.2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                                child: Text(
                                  'We provide the digital services which you need to create and develop your business',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            Container(
                              height: 44.0,
                              width: 240,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF98BDD8),
                                  Color(0xFFAEBDD8)
                                ]),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  controllerOne.animateTo(4050,
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),

                            //SizedBox(height: 200),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 750,
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              'About us',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                        SizedBox(height: 70),
                        Center(
                          child: Container(
                            width: size.width / 1.5,
                            child: Text(
                              'UoB Junior Solutions is a consulting firm that is run by University of Birmingham students. We provide digital solutions, data analytics and strategy services to individuals, small and medium companies, as well as institutions. Through the provision of these high quality services at competitive prices, we aim to aid and facilitate businesses in their development.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                decoration: TextDecoration.none,
                                letterSpacing: 0,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 44.0,
                          width: 240,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF98BDD8), Color(0xFFAEBDD8)]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              downloadFile("/pitchbook/UOBJS_Presentation.pdf");
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text(
                              'Pitchbook',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            'Our Services',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
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
                      SizedBox(
                        height: 60,
                      ),
                      card2(
                          s: 'Web Development',
                          i: 'Assets/lines.png',
                          c2: Color(0xffac5e4c),
                          c1: Color(0xffcc9384)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: 400,
                          child: Text(
                            'Increase your online presence with:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 111,
                              width: 2.7,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Static Website Development',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' E-commerce Website',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Web Applications',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 1,
                        width: size.width / 1.6,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      card2(
                          s: 'Software Engineering',
                          i: 'Assets/waves.png',
                          c1: Color(0xffbdc3c7),
                          c2: Color(0xff2c3e50)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: 400,
                          child: Text(
                            'Increase your efficiency with:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 111,
                              width: 2.7,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Mobile App Development',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Complete software build',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Business Automation',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 1,
                        width: size.width / 1.6,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      card2(
                          s: 'Data',
                          i: 'Assets/lines.png',
                          c2: Color(0xff2c646c).withOpacity(1),
                          c1: Color(0xff044454).withOpacity(1)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: 400,
                          child: Text(
                            'Unlocking your full potential with:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 111,
                              width: 2.7,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Data Engineering',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Business Data Analysis',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Energy Data Analysis',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 1,
                        width: size.width / 1.6,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      card2(
                          s: 'Strategy',
                          i: 'Assets/waves.png',
                          c1: Color(0xd8000428).withOpacity(0.9),
                          c2: Color(0xff004e92).withOpacity(0.8)),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: 400,
                          child: Text(
                            'Increase your efficiency with:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 111,
                              width: 2.7,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Market Research',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Translation',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Container(
                                    width: 320,
                                    child: Text(
                                      ' Automated Marketing',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            'A question?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Do not hesitate to contact us !',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
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
                      SizedBox(
                        height: 100,
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SizedBox(
                          width: size.width / 1.1,
                          height: 600,
                          child: Center(
                              child: Column(
                            children: [
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: size.width / 2.4,
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      controller: TextEditingController(
                                          text: info.name),
                                      onChanged: (val) {
                                        info.name = val;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Name',
                                          hintStyle: TextStyle(fontSize: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.all(16),
                                          fillColor: Colors.grey[200]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 70,
                                    width: size.width / 2.4,
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      controller: TextEditingController(
                                          text: info.email),
                                      onChanged: (val) {
                                        info.email = val;
                                      },
                                      validator: (value) {
                                        if (!value!.contains(RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                                          return 'Email is not valid';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(fontSize: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.all(16),
                                          fillColor: Colors.grey[200]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: size.width / 2.4,
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      // controller: searchCtrl,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Company',
                                          hintStyle: TextStyle(fontSize: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.all(16),
                                          fillColor: Colors.grey[200]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 70,
                                    width: size.width / 2.4,
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      controller: TextEditingController(
                                          text: info.subject),
                                      onChanged: (val) {
                                        info.subject = val;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Subject',
                                          hintStyle: TextStyle(fontSize: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.all(16),
                                          fillColor: Colors.grey[200]),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 300,
                                width: size.width / 1.170,
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  controller:
                                      TextEditingController(text: info.message),
                                  onChanged: (val) {
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
                                      fillColor: Colors.grey[200]),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 44.0,
                                width: 240,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF98BDD8),
                                    Color(0xFFAEBDD8)
                                  ]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      save();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Phone()));
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alerte(context);
                                        },
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: Text(
                                    'Send',
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Copyright © UOB Junior Solution 2022',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _launchURL1(Uri.parse(
                                  "https://www.instagram.com/uobjuniorsolutions/"));
                            },
                            icon: Icon(FontAwesomeIcons.instagram),
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () {
                              _launchURL1(Uri.parse(
                                  "https://uk.linkedin.com/company/uob-junior-solutions?original_referer=https%3A%2F%2Fwww.google.com%2F"));
                            },
                            icon: Icon(FontAwesomeIcons.linkedin),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _launchURL1(var uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }
}

downloadFile(url) {
  AnchorElement anchorElement = new AnchorElement(href: url);
  anchorElement.download = "Pitch_Book";
  anchorElement.click();
}
