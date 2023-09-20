import 'dart:typed_data';
class Meal {
  String name;
  String country;
  int complexity;
  int id;
  String imageurl;
  Uint8List image_memory;
  String ingredients;
  String steps;
  int time;
  String nutrivalues;
  String description;





  Meal(this.name, this.complexity, this.country, this.id, this.image_memory,
      this.imageurl,this.description,this.ingredients,this.nutrivalues,this.steps,this.time);
}