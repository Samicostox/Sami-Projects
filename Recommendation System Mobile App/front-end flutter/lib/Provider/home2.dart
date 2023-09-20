import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:nut/Food/foodDisplay.dart';
import 'package:nut/Food/food_page.dart';
import 'package:nut/Pages/Profile.dart';
import 'package:nut/Pages/charts.dart';
import 'package:nut/Pages/speech_reco.dart';
import 'package:nut/Pages/workout_page.dart';



class home extends StatefulWidget {
  int i;

  home({Key? key, required this.i}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  //GlobalKey<GNavState> _NavKey = GlobalKey();

  var pagesAll = [Display_food(),charts(),Profile()];

  var myindex = 0;
  int index = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(


        items: <Widget>[
          Icon(Icons.food_bank, size: 30),
          Icon(Icons.add_chart, size: 30),
          Icon(Icons.person, size: 30),

          Icon(Icons.sports_baseball,size: 30,),
          Icon(Icons.read_more,size: 30,),
        ],
        buttonBackgroundColor : Color(0xFF086200),
        color: Color(0xFF086200).withOpacity(0.5),
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        index: widget.i,
        onTap: (selctedIndex){
          setState(() {
            widget.i = selctedIndex;
          });
        },
      ),
      body: getSelectedWidget(index: widget.i)
    );

  }
  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Display_food();
        break;
      case 1:
        widget = const charts();
        break;
      case 2:
        widget = const Profile();
        break;
      case 3:
        widget = const workoutpage();
        break;
      default:
        widget = const speech_reco();
        break;
    }
    return widget;
  }
}
