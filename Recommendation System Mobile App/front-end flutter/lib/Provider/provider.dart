import 'dart:typed_data';

import 'package:flutter/material.dart';

class ID extends ChangeNotifier{
  int id;
  String name;
  Uint8List image;

  ID(this.id,this.name,this.image);

  int getid() => this.id;

  void setID(int value) => this.id = value;

  String getName() => this.name;

  void setName(String value) => this.name = value;

  Uint8List getImage() => this.image;

  void setImage(Uint8List value) => this.image = value;

}
