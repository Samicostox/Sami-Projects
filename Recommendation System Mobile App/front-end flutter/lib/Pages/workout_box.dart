import 'package:flutter/material.dart';
import 'package:nut/Data/workout_data.dart';

class workout_box extends StatefulWidget {

  List work;
  String name;
  workout_box({Key? key,required this.work,required this.name}) : super(key: key);

  @override
  State<workout_box> createState() => _workout_boxState();
}

class _workout_boxState extends State<workout_box> {
  List workout = ["• Squats - 3 sets of 10-15 repetitions",
    "• Lunges - 3 sets of 10-15 repetitions",
    "• Push-Ups - 3 sets of 10-15 repetitions",
    "• Dumbbell Overhead Press - 3 sets of 10-15 repetitions",
    "• Planks - 3 sets of 30-60 seconds"];

  Widget customtext(List workoutt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        for (int i = 0; i <= workoutt.length - 1; i = i + 1)


              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: Text(
                   workoutt[i],
                  style: TextStyle(fontFamily: 'Poppins',
                  fontSize: 20),

                ),
              ),


      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(


        width: 370,


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(1, 3), // Shadow position
            ),
          ],
        ),
        child: Column(

          children: [
            //SizedBox(height: 15,),
            Container(
              width: 370,
              height: 40,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: Color(0xFF086200),
              ),

              child: Center(
                child: Text(widget.name,style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  color: Colors.white

                ),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 370,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    customtext(widget.work)

                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
