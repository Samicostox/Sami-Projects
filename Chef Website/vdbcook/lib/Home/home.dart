import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdbcook/widget/buttonhover.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




import '../data/Email.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home>{

  List<String> images = [
    "Assets/cook.jpg",
    "Assets/oignons.jpg",
    "Assets/casserol.jpg"
  ];

  ScrollController controllerOne = ScrollController();



  @override
  void initState() {
    controllerOne = ScrollController();

    super.initState();
  }

  sendEmail info = sendEmail('', '', '', '','');

  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');


  Future save() async {
    print('toto');
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'service_id': 'service_hm7nlhb',
          'template_id': 'template_hztyvxh',
          'user_id': '0jPttbRmdO2fMh_tY',
          'template_params':{
            'user_name': info.name,
            'user_email' : info.email,
            'user_subject' : 'Website Request',
            'user_message' : info.message,
            'user_town' : info.Town,
            'user_phone' : info.Phone
          },



        })
    );
  }




  Color blue = Color(0xff122f54);
  Color gold = Color(0xffc29248);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff122f54),
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80,0,0,0),
          child: Text(
            'VDB COOK',
            style: TextStyle(
              color: Color(0xffc29248),
              fontFamily: 'Montserrat',
              fontSize: 30,
              fontWeight: FontWeight.bold,
                letterSpacing: 1.5
            ),

          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsets.fromLTRB(0,25,0,0),
            child: buttonHover(title: 'ACCUEIL', controller: controllerOne,position: 51, min: 50, max: 800,),
          ),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,25,0,0),
            child: buttonHover(title: 'MENU',controller: controllerOne,position: 801 , min: 800, max: 2580,),
          ),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,25,0,0),
            child: buttonHover(title: 'SERVICES',controller: controllerOne,position: 2581 , min: 2580, max: 3399,),
          ),
          SizedBox(width: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,25,0,0),
            child: buttonHover(title: 'CONTACT',controller: controllerOne,position: 3701 , min: 3400, max: 5000,),
          ),

          SizedBox(width: 80,),
        ],
      ),
      body: SingleChildScrollView(
        controller: controllerOne,


          child: Column(
            children: [

              Container(
                height: 780,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("Assets/cook.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.5
                  ),
                ),
                child: Column(
                      children: [


                        SizedBox(height: 90,),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('Assets/Noir et Or Cercle Immobilier Logo (2).png'),
                            radius: 160,
                          ),

                        ),
                        SizedBox(height: 50,),
                        Text('Tristan Vandenberghe',
                          style: TextStyle(
                            color: gold,
                            fontSize: 60,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',

                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 1,
                          width: size.width/1.2,
                          color: gold,
                        ),
                        SizedBox(height: 20,),
                        Text('Cook',
                          style: TextStyle(
                            color: gold,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,

                          ),),
                        SizedBox(height: 100,)
                      ],
                    ),
              ),













              Column(
                children: [
                  Container(
                    height: 1800,
                    width: size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Text('MENU',
                          style: TextStyle(
                            color: gold,
                            fontSize: 50,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',

                          ),
                        ),
                        Container(
                          height: 1,
                          width: size.width/1.2,
                          color: gold,
                        ),
                        SizedBox(height: 20,),
                       
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                           Container(
                              height: 755,


                              child: Image.asset('Assets/entrée-1.png')),

                           SizedBox(width: size.width/1000,),

                           Container(
                               height: 755,


                               child: Image.asset('Assets/Plat-1.png')),



                         ],
                       ),

                        SizedBox(height: 40,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                                height: 755,



                                child: Image.asset('Assets/dessert-1.png')),

                            SizedBox(width: size.width/1000,),

                            Container(
                                height: 755,



                                child: Image.asset('Assets/cocktails.png')),
                          ],
                        )


                       /* Center(
                          child: Container(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/cook.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,


                                        ),
                                        textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/oignons.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,


                                        ),
                                        textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/cook.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                      style: TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,


                                      ),
                                      textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ), */
                       /* SizedBox(height: 60,),
                        Center(
                          child: Container(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/cook.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,


                                        ),
                                        textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/cook.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,


                                        ),
                                        textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        height: 200,
                                        child: Image(image: AssetImage('Assets/cook.jpg'))),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 300,
                                      child: Text('Heading',
                                        style: TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                        textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 300,
                                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut nibh in risus posuere vulputate. Etiam vel nisi ut augue ultricies interdum. Proin tincidunt quis lectus ac eleifend. Nullam imperdiet auctor sapien sed vulputate.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,


                                        ),
                                        textAlign: TextAlign.left,),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ), */
                      ],
                    ),
                  ),


                ],
              ),
              SizedBox(height: 50,),

              Container(
                height: 1050,
                child: Column(
                  children: [
                    Text('SERVICES',
                    style: TextStyle(
                      color: gold,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'
                    ),
                    ),
                    Container(
                      height: 1,
                      width: size.width/1.2,
                      color: gold,
                    ),
                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height : 400,

                          child: Image.asset('Assets/square1.jpg')),
                        SizedBox(width: 25,),
                        Container(
                          width: 350,
                          child: Text('Je m’appelle Tristan Vandenberghe, j’ai 21 ans et je suis une formation culinaire dans la prestigieuse école de FERRANDI Paris depuis presque 5 ans. En parallèle, mon cursus m’a permis d’apprendre en alternance dans différentes maisons tel que le Ministère des Affaires Étrangères au quai d’Orsay, au restaurant des Cocottes du chef Christian Constant et plus récemment dans le restaurant étoilé d’un palace parisien.',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 18,


                            ),
                          ),
                        ),




                      ],
                    ),

                    SizedBox(height: 30,),
                    Container(
                      height: 1,
                      width: size.width/1.2,
                      color: gold,
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 25,),
                        Container(
                          width: 350,
                          child: Text('Le savoir faire dont je me nourris me permettra de sublimer vos assiettes dans une expérience gastronomique remplie de gourmandise et de partage directement chez vous. De 2 à 12 convives, vous pourrez choisir entre différentes formules en 2, 3, 5 ou 7 séquences en menu unique. Je propose également une offre de canapés pour vos réceptions jusqu’a 40 invités. Je suis, bien entendu, ouvert a toutes propositions et demandes afin de vous offrir l’expérience la plus ressemblante a vos attentes.',
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 18,


                            ),
                          ),
                        ),
                        Container(
                            height : 400,

                            child: Image.asset('Assets/profile_cropped.jpg')),
                      ],
                    ),

                  ],
                ),
              ),



              Container(
                height: 800,
                width: size.width,
                color: blue,
                child: Column(
                  children: [
                    SizedBox(height: 60,),
                    Text('CONTACT ME',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50,
                        color: gold,


                      ),
                    ),
                    Container(
                      height: 1,
                      width: size.width/1.2,
                      color: gold,
                    ),
                    SizedBox(height: 20,),
                    Card(
                      color: Colors.white,
                      elevation: 20,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SizedBox(
                        width: size.width/1.1,
                        height: 600,
                        child:
                        Center(child:

                        Column(
                          children: [

                            SizedBox(height: 50),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  height: 70,
                                  width: size.width/2.5,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: TextEditingController(text: info.name),
                                    onChanged: (val){
                                      info.name = val;
                                    },

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'Nom',

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
                                  width: size.width/2.5,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  height: 70,
                                  width: size.width/2.5,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: TextEditingController(text: info.Phone),
                                    onChanged: (val){
                                      info.Phone = val;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'Telephone',

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
                                  width: size.width/2.5,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: TextEditingController(text: info.Town),
                                    onChanged: (val){
                                      info.Town = val;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: 'Ville',

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
                              width: size.width/1.2,
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
                              decoration: BoxDecoration(
                                color: gold,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),

                              child: ElevatedButton(
                                onPressed: () {
                                  save();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                                  print(info.name);
                                },
                                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                                child: Text('Envoyer',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: blue,
                                      fontWeight: FontWeight.bold
                                  ),

                                ),
                              ),
                            ),




                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 240,
                width: size.width,
                child: Column(
                  children: [

                    SizedBox(height: 80,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('LOCALISATION',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                        ),
                        ),
                        Text('RESEAUX SOCIAUX',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text('20 rue des platanes',
                            style: TextStyle(
                                fontSize: 20,

                                fontFamily: 'Awesome'
                            ),
                          ),
                        ),



                        Row(
                          children: [
                            IconButton(
                               onPressed: () { _launchURL1(Uri.parse("https://www.instagram.com/vdb_cook/")); },
                              icon: Icon(FontAwesomeIcons.instagram),
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () { _launchURL1(Uri.parse("")); },
                              icon: Icon(FontAwesomeIcons.facebook),
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () { _launchURL1(Uri.parse("")); },
                              icon: Icon(FontAwesomeIcons.twitter),
                              iconSize: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child: IconButton(
                                onPressed: () { _launchURL1(Uri.parse("https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley")); },
                                icon: Icon(FontAwesomeIcons.youtube),
                                iconSize: 40,
                              ),
                            ),

                          ],

                        ),


                      ],
                    )

                  ],
                ),
              ),
              Container(
                height: 70,
                width: size.width,
                color: blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Copyright © Tristan Vandenberghe 2022',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),

    );
  }

  _launchURL1(var uri) async {

    if (await canLaunchUrl(uri)){
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }

}
