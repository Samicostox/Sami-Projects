

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:nut/login/register.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nut/login/verifyemail.dart';

import 'background.dart';
import 'log.dart';
import 'package:get/get.dart';






class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController age = TextEditingController();


  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if(_pickedFile != null){
      setState((){
        _image = File(_pickedFile!.path);
      });
    }
  }


  final _formKey = GlobalKey<FormState>();
  register reg = register('', '', '', '',0);

  // http backen connection
  var url = Uri.parse('http://10.0.2.2:8000/api/register');

  Future save() async {
    print('toto');
    http.MultipartRequest res = http.MultipartRequest('POST', url,);
    res.fields['email'] = reg.email;
    res.fields['password'] = reg.Password;
    res.fields['username'] = reg.Username;
    res.fields['age'] = reg.age.toString();

    if (GetPlatform.isMobile && _pickedFile != null) {
      File _file = File(_pickedFile!.path);
      res.files.add(http.MultipartFile.fromBytes(
          'profilepic', File(_pickedFile!.path).readAsBytesSync(),
          filename: _pickedFile!.path
              .split('/')
              .last));
    }

    var ress = await res.send();

    print(reg.email);
    if (ress.statusCode == 200) {
      Map data = jsonDecode(await ress.stream.bytesToString()) as Map;


      print('--------------------------------');
      String msg = data['msg'];
      int id = data['id'];
      //String token = data['accessToken'];
      print(msg);
      AlertDialog alert = AlertDialog(
        title: Center(child: Icon(
          Icons.close,
          color : Colors.red,
          size: 50,
        )
        ),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: Center(child: Text("Cancel")),
            onPressed:  () {
              Navigator.of(context).pop();
            },
          )
        ],
      );


      if(msg=='success'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => verifyemail(id: id)));

      }else if(msg!='success'){
        print('aaa');

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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Color(0xFF086200),
                        fontSize: 36,
                      fontFamily: 'Poppins'
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),


                SizedBox(height: size.height * 0.03),

                Container(
                  child: GestureDetector(
                    child:  Container(child: _pickedFile != null
                        ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(50), // Image radius
                          child: Image.file(File(_pickedFile!.path),
                              fit: BoxFit.cover),
                        ),

                      ),
                    )
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(50), // Image radius
                        child: Image.asset('Assets/default.png',fit: BoxFit.cover),

                      ),

                    ),
                    ),
                    onTap: () => pickImage(),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username"
                    ),
                    controller: TextEditingController(text: reg.Username),
                    onChanged: (val){
                      reg.Username = val;
                    },
                    validator: (value){
                      if (value!.length < 3){
                        return 'Username is not Valid';
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
                        labelText: "Email Adress"
                    ),
                    controller: TextEditingController(text: reg.email),
                    onChanged: (val){
                      reg.email = val;
                    },
                    validator: (value){
                      if (!value!.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))){
                        return 'Email is not valid';
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
                    controller: TextEditingController(text: reg.Password),
                    onChanged: (val){
                      reg.Password = val;
                    },
                    validator: (value){
                      if (!value!.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')) || value.length < 8){
                        return 'Passsord is not valid';
                      }
                      return null;
                    },
                    obscureText: true,

                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Age"
                    ),
                    keyboardType: TextInputType.number,
                    controller: age,
                    onChanged: (val){
                      reg.age = int.parse(val);
                    },
                    validator: (value){
                      if (value!.length < 1){
                        return 'age is not Valid';
                      }
                      return null;
                    },

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
                          showDialog(context: context,
                              builder: (BuildContext context) =>
                                  SimpleDialog(
                                      title: const Text(
                                        'SIGNING UP .......',
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
                            'Register',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                    },
                    child: Text(
                      "Already Have an Account? Sign in",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        fontFamily: 'Poppins'
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
