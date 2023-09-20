import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Data/speech.dart';
import 'package:nut/Pages/detailedfoodpage_speech.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class speech_reco extends StatefulWidget {
  const speech_reco({Key? key}) : super(key: key);

  @override
  State<speech_reco> createState() => _speech_recoState();
}

class _speech_recoState extends State<speech_reco> {

  String user_input = '';

  speech f = speech('', [], '', '', []);

  Future save(String u_input) async {

      var url = Uri.parse('http://localhost:8000/api/openai');
      var res = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8',},
          body: json.encode({
            'user_prompt': u_input,//user.username,//'Test2',//user.username,

          })
      );
      //print(user.username);
      //print(user.password);
      //print(res.body);

      print('toto');

      showDialog(context: context,
          builder: (BuildContext context) =>
              SimpleDialog(
                  title: const Text(
                    'Generating you a Meal .......',
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
      if(res.statusCode==200) {

        Map info = jsonDecode(res.body) as Map;

        f.name = info['name'];
        print(f.name);
        f.imageurl = info['image_url'];
        f.nutri_values = info['nutri_values'];
        f.description = info['description'];
        print(f.description);
        f.ingredients = info['ingredients'];
        print(f.ingredients);




        Navigator.push(context, MaterialPageRoute(builder: (context) => detailfood_speech(food: f)));


        //print(res.body);

    }
  }

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Ask whatever you want I will recommend you a meal !';
  double _confidence = 1.0;
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(

          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          backgroundColor: Color(0xFF086200),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: Text(
               _text,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;

            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      print('aa');
      save(_text);
      showDialog(context: context,
          builder: (BuildContext context) =>
              SimpleDialog(
                  title: const Text(
                    'Generating you a Meal .......',
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



      _speech.stop();
    }
  }
}
/*

 */