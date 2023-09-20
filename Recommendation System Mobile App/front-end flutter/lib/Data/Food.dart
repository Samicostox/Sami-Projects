import 'dart:typed_data';
class Food {
  String name;
  String country;
  int complexity;
  int id;
  String imageurl;
  Uint8List image_memory;


  Food(this.name, this.complexity, this.country, this.id, this.image_memory,
      this.imageurl);
}