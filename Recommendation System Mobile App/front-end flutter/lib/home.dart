import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:nut/Food/foodDisplay.dart';
import 'package:nut/Food/food_page.dart';
import 'package:nut/Pages/Profile.dart';
import 'package:nut/Pages/charts.dart';

import 'Data/Food.dart';

class home2 extends StatefulWidget {
  int i;

  home2({Key? key, required this.i}) : super(key: key);

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {

  //GlobalKey<GNavState> _NavKey = GlobalKey();

  var pagesAll = [Display_food(),charts(),Profile()];

  var myindex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: GNav(

            //key: _NavKey,
            backgroundColor: Colors.white,
            activeColor: Color(0xFF086200),
            tabBackgroundColor: Color(0xFF35AE2A).withOpacity(0.2),
            tabBorderRadius: 15,
            padding: EdgeInsets.all(16),



            gap: 1,
            tabs:[
              GButton(icon: Icons.food_bank,
                text: 'Meals',),
              GButton(icon: Icons.add_chart,
                text: 'Charts',),
              GButton(icon: Icons.person  ,
                text: 'Profile',),


            ],
            selectedIndex: widget.i,
            onTabChange: (index) {
              setState(() {
                widget.i = index;
              });
            },


          ),
        ),
        body: Center (child: pagesAll.elementAt(widget.i),)
    );
  }
}
