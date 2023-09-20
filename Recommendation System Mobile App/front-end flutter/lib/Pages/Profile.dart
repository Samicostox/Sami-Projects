import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nut/Pages/EditPhysic.dart';
import 'package:nut/Pages/EditPreferences.dart';


import '../Data/profile.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


import '../Provider/provider.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();








  }









  class _ProfileState extends State<Profile> {

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


    profile user = profile(base64Decode('toto'),"", "", "",);
    var url = Uri.parse('http://10.0.2.2:8000/api/profile');
    int idd = 0;
    Future save(int id) async {
      idd = id;

      var res = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8',},
          body: json.encode({
            'user_id': id,
          })
      );
      if (res.statusCode == 200) {
        Map data = jsonDecode(res.body) as Map;

        //user = ProfileUser(data['name'], data['email'], data['username'], data['betplayed'], data['betwon'], base64Decode(data["image_memory"]), data['profilepic']);
        user.username = data['username'];
        user.image_memory = base64Decode(data["image_memory"]);
        user.email = data['email'];

        print(user.username);
      }
      return user;
    }



    var url2 = Uri.parse('http://10.0.2.2:8000/api/profile');

    Future save2(int id) async {
      print('tata');
      http.MultipartRequest res = http.MultipartRequest('PUT', url,);
      print('titi');
      res.fields['email'] = user.email;
      res.fields['userid'] = id.toString();

      res.fields['username'] = user.username;

      if (GetPlatform.isMobile && _pickedFile != null) {
        File _file = File(_pickedFile!.path);
        res.files.add(http.MultipartFile.fromBytes(
            'profilepic', File(_pickedFile!.path).readAsBytesSync(),
            filename: _pickedFile!
                .path
                .split('/')
                .last));
      }
      var ress = await res.send();

      if (ress.statusCode == 200){
        var response = await http.Response.fromStream(ress);
        Map info = jsonDecode(response.body) as Map;
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

        if(msg == "your account has been updated !"){

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        }
      }
    }

    late final Future myFuture;

    @override
    void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) => save(idd));
      myFuture = save(Provider.of<ID>(context,listen: false).getid());
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
          child: Container(
            color: Colors.white,
            height: size.height / 1.1,
            width: size.width,
            child: Stack(

              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      height: 270,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [
                              Color(0xFF35AE2A),
                              Color(0xFF086200),
                            ]
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: Center(
                          child: Text('Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 40,
                                fontWeight: FontWeight.w500
                            ),),
                        ),
                      ),
                    )),

                Column(
                  children: [
                    SizedBox(height: 230,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      //height: 600,
                      width: size.width,
                      child: Form(
                        child: Column(

                          children: [
                            SizedBox(height: 90,),
                            Container(

                              width: size.width / 1.1,
                              child: TextFormField(

                                controller: TextEditingController(
                                    text: user.username),
                                onChanged: (val) {
                                  user.username = val;
                                },

                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.edit,
                                  ),
                                  border: OutlineInputBorder(


                                  ),

                                  labelText: 'Name',
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
                            SizedBox(height: 25,),

                            Container(

                              width: size.width / 1.1,
                              child: TextFormField(

                                controller: TextEditingController(
                                    text: user.email),
                                onChanged: (val) {
                                  user.email = val;
                                },

                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.edit,
                                  ),
                                  border: OutlineInputBorder(


                                  ),

                                  labelText: 'Email',
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

                            SizedBox(height: 25,),

                            Container(
                              width: 230,
                              height: 46,

                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)
                                    ),
                                    primary: Color(0xff35AE2A)
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => editphysic()));
                                },
                                child: Text('Edit Physical Information',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15
                                  ),),
                              ),
                            ),

                            SizedBox(height: 15,),

                            Container(
                              width: 230,
                              height: 46,

                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)
                                    ),
                                    primary: Color(0xff35AE2A)
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => editpreferences()));
                                },
                                child: Text('Edit Food Preferences',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15
                                  ),),


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
                                  save2(Provider.of<ID>(context, listen: false)
                                      .getid());
                                  print('toto');
                                },
                                child: Text('Save',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16
                                  ),),


                              ),
                            )


                          ],
                        ),
                      ),
                    ),


                  ],
                ),
                Positioned(

                  top: 170,
                  left: 140,

                  child: Container(
                    child: GestureDetector(
                      child: Container(child: _pickedFile != null
                          ? Center(
                        child: PhysicalModel(
                          elevation: 10,
                          shape: BoxShape.circle,
                          color: Colors.black,
                          child: CircleAvatar(
                            radius: 66,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: FileImage(
                                  File(_pickedFile!.path)),
                              radius: 60,

                            ),
                          ),
                        ),
                      )
                          : PhysicalModel(
                        elevation: 10,
                        shape: BoxShape.circle,
                        color: Colors.black,
                        child: CircleAvatar(
                          radius: 66,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage: MemoryImage(user.image_memory),
                            radius: 60,

                          ),
                        ),
                      ),
                      ),
                      onTap: () => pickImage(),
                    ),
                  ),


                ),

                /*child: GestureDetector(
                        child: PhysicalModel(
                          elevation: 10,
                          shape: BoxShape.circle,
                          color: Colors.black,
                          child: CircleAvatar(
                            radius: 66,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: MemoryImage(user.image_memory),
                              radius: 60,

                            ),
                          ),
                        ),
                        onTap: () => pickImage(),
                      ),*/


              ],


            ),
          ),
        );
      }
        }
      ),
    );
  }


  }
