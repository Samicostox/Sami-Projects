
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nut/Data/food_new.dart';
import 'package:nut/Food/food_page.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../Data/Food.dart';
import '../Provider/provider.dart';

const List<Widget> vegetables = <Widget>[
  Text('food name'),
  Text('ingredients'),


];

class Display_food extends StatefulWidget {
  const Display_food({Key? key}) : super(key: key);

  @override
  State<Display_food> createState() => _Display_foodState();
}

class _Display_foodState extends State<Display_food> {
  final controller = TextEditingController();

  Food food2 = Food("", 0, "", 0, base64Decode("image_memory"), "");

  int n = 0;
  List<food_new> display = [];
  List<food_new> display2 = [];
  var items = <Food>[];
  List<Food> foods = [];

  String foodname = '';

  int id = 0;

  var url2 = Uri.parse('http://10.0.2.2:8000/api/mealquery');

  Future  query() async {
    display.clear();

    var res = await http.post(url2,
      headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'foodname': foodname,//user.username,//'Test2',//user.username,

        })

    );

    print('avant code 2000');
    if (res.statusCode == 200) {
      print('test');

      Map data = jsonDecode(res.body) as Map;
      print('test2');


      // don't forget in the futur to add bet_request_id


      print(display.length);

      var a = data['msg'];

      print("food.name");

      for(var u in a) {

        food_new food = food_new("", "", 0, "", [], 0,[],0,[],[]);

        print("food.name");

        food.name = u['name'];
        print(food.name);

        food.id = u['id'];

        food.ingredients = u['ingredients'];

        food.tags = u['tags'];

        food.steps = u['steps'];

        food.imageurl = u['foodpic'];

        food.nutri_values = u['nutri_values'];

        food.ratings = u['rating'];

        food.n_steps = u['n_steps'];

        food.description = u['description'];

        display2.add(food);



      }

      setState(() {

        display = display2;
      });







      print(display[0]);

    }
    return display;

  }

  var url3 = Uri.parse('http://10.0.2.2:8000/api/ingredientsquery');

  Future  query2() async {
    display.clear();

    var res = await http.post(url3,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'ingredients': foodname,//user.username,//'Test2',//user.username,

        })

    );

    print('avant code 2000');
    if (res.statusCode == 200) {
      print('test');

      Map data = jsonDecode(res.body) as Map;
      print('test2');


      // don't forget in the futur to add bet_request_id


      print(display.length);

      var a = data['msg'];

      print("food.name");

      for(var u in a) {

        food_new food = food_new("", "", 0, "", [], 0,[],0,[],[]);

        print("food.name");

        food.name = u['name'];
        print(food.name);

        food.id = u['id'];

        food.ingredients = u['ingredients'];

        food.tags = u['tags'];

        food.steps = u['steps'];

        food.imageurl = u['foodpic'];

        food.nutri_values = u['nutri_values'];

        food.ratings = u['rating'];

        food.n_steps = u['n_steps'];

        food.description = u['description'];

        display2.add(food);



      }

      setState(() {

        display = display2;
      });







      print(display[0]);

    }
    return display;

  }




  var url = Uri.parse('http://10.0.2.2:8000/api/reco');
  Future save() async {
    display.clear();
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({
          'user_id': Provider.of<ID>(context,listen: false).getid(),//user.username,//'Test2',//user.username,

        })

    );
    print('avant code 20000');
    if (res.statusCode == 200) {


      Map data = jsonDecode(res.body) as Map;

      var a = data['msg'];
      var b = data['bet_request_id'];

      // don't forget in the futur to add bet_request_id

      for(var u in a){
        food_new food = food_new("", "", 0, "", [], 0,[],0,[],[]);

        food.name = u['name'];


        food.id = u['id'];


        food.ingredients = u['ingredients'];

        food.tags = u['tags'];

        food.steps = u['steps'];

        food.imageurl = u['foodpic'];

        food.nutri_values = u['nutri_values'];

        food.ratings = u['rating'];

        food.n_steps = u['n_steps'];

        food.description = u['description'];

        display.add(food);

      }
      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');





    }
    return display;
  }




  late final Future myFuture;

  @override
  void initState() {
    display.clear();
    myFuture = save();




  }
  bool vertical = false;
  bool type_of_search = false;
  final List<bool> _selectedVegetables = <bool>[true, false];




  @override
  Widget build(BuildContext context) {





    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      body: FutureBuilder(
        future : myFuture,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: Container(
                width: 100,
                height: 100,
                child: Lottie.asset('lotties/loading-blue.json')));
          } else
           { return SingleChildScrollView(
             physics: ScrollPhysics(),
             child: Container(
               height: (size.height/6)*display.length+size.height/1.3 ,
               child: Column(
                 //mainAxisSize: MainAxisSize.max,
                 children: [
                   SizedBox(height: 30,),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         CircleAvatar(
                           radius: 30,
                           backgroundImage: MemoryImage(Provider.of<ID>(context,listen: false).getImage()),
                         ),

                         IconButton(onPressed: (){}, icon: Icon(Icons.notifications),)

                       ],
                     ),



                   ),

                   SizedBox(height: 40,),

                   Padding(
                     padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                           child: Text('Hi ' + Provider.of<ID>(context,listen: false).getName() + ' 👋',
                           style: TextStyle(
                             color: Color(0xFF086200),
                             fontSize: 35,
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.bold
                           ),),
                         ),

                       ],
                     ),
                   ),

                   SizedBox(height: 11.5,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       Container(
                         width: size.width/1.3,
                         height: 60,
                         child: Padding(
                           padding: const EdgeInsets.all(0.0),
                           child: TextField(


                             controller: controller,
                             decoration: InputDecoration(
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(4)),
                                   borderSide: BorderSide(width: 0,color: Colors.white),
                                 ),

                               fillColor: Colors.white,
                               filled: true,
                               prefixIcon: Icon(Icons.search,color: Color(0xFF086200)),
                               suffixIcon: IconButton(icon: Icon(Icons.check,color: Color(0xFF086200)), onPressed: (){
                                 if(type_of_search == false){
                                   query();
                                   print('food_name_updating');
                                 }else if(type_of_search == true){
                                   query2();
                                   print('food_ingredients_updating');
                                 }


                               },),
                               hintText: 'Search',
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                                 borderSide: BorderSide(color: Colors.white,width: 0),


                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                                 borderSide: BorderSide(width: 0, color: Colors.white),
                               ),
                             ),
                             onChanged: (value) {



                               foodname = value;

                             },
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                         child: Container(
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: AssetImage('Assets/slider.png'),

                             ),
                             color : Color(0xFF086200),
                             borderRadius: BorderRadius.all(
                               Radius.circular(12.0),
                             ),
                           ),
                           height: 45,
                           width: 45,

                         ),
                       ),

                     ],
                   ),
                   const SizedBox(height: 20),
                   Text('Choose your type of search', style: TextStyle(color: Color(0xFF086200),fontSize: 20,
                     fontFamily: 'Poppins',)),
                   const SizedBox(height: 5),
                   Container(

                     child: ToggleButtons(
                       direction: vertical ? Axis.vertical : Axis.horizontal,
                       onPressed: (int index) {
                         print(index);
                         if (index == 0){
                           setState(() {
                             type_of_search = false;
                             _selectedVegetables[index] = true;
                             _selectedVegetables[1] = false;
                           }


                           );
                         }else if(index ==1 ){
                           setState(() {
                             type_of_search = true;
                             _selectedVegetables[index] = true;
                             _selectedVegetables[0] = false;
                           }
                           );
                         }
                         print(type_of_search);
                         // All buttons are selectable.

                       },
                       borderRadius: const BorderRadius.all(Radius.circular(8)),
                       selectedBorderColor: Colors.green[700],
                       selectedColor: Colors.white,
                       fillColor: Colors.green[200],
                       color: Colors.green[400],
                       constraints: const BoxConstraints(
                         minHeight: 40.0,
                         minWidth: 120.0,
                       ),
                       isSelected: _selectedVegetables,
                       children: vegetables,
                     ),
                   ),

                   SizedBox(height: 30,),
                   Container(
                     decoration: BoxDecoration(
                          gradient: new LinearGradient(
                          colors: [
                          Color(0xFF35AE2A),
                          Color(0xFF086200),
                          ]
                        ),

          borderRadius: BorderRadius.all(
                         Radius.circular(25.0),
                       ),

                     ),
                     height: 150,
                     width: size.width/1.1,

                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                           child: Text ('Nutrition Vault',
                           style: TextStyle(
                             fontSize: 24,
                             color: Colors.white,
                             fontFamily: 'Poppins'

                           ),),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                           child: Container(
                             width: 300,
                             child: Text ('This Page recommends you meal based on your preferences and goals.',
                               style: TextStyle(
                                   fontSize: 14,
                                   color: Colors.white,
                                   fontFamily: 'Poppins'

                               ),),
                           ),
                         ),

                       ],
                     ),


                   ),

                   Padding(
                     padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
                     child: Container(
                       width: size.width,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Meals',
                             style: TextStyle(
                               color: Color(0xFF086200),
                               fontFamily: 'Poppins',
                               fontSize: 22,
                               fontWeight: FontWeight.bold

                             ),
                               ),
                         ],
                       ),
                     ),
                   ),
                   //SizedBox(height: 30,),



                   Expanded(
                     child: Container(
                       height: size.height*display.length/50 ,

                         child: ListView.builder(
                             physics: NeverScrollableScrollPhysics(),

                            itemCount: display.length,
                            itemBuilder: (BuildContext context,int index) {

                              return foodPage(food: display[index]);

                            }),
                       ),

                   ),


                 ],
               ),
             ),
           ); }

        },


      ),


    );

  }

  Future<void> setValue(Future<dynamic> food) async {

    setState(() {
      
    });

  }


  void searchMeal(String query){


    final suggestions = display.toSet().where((food){
      final foodname = food.name.toLowerCase();
      final input = query.toLowerCase();


      return foodname.contains(input);

    }).toList();

    setState(() {
      display = suggestions;
    });

  }
}

