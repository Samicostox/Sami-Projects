import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class food_new{

  String name;
  String description;
  List ingredients ;
  List steps;
  List nutri_values;
  List tags;
  int n_steps;
  int ratings;



  int id;
  String imageurl;

  food_new(this.description,this.imageurl,this.id,this.name,this.ingredients,this.n_steps,this.nutri_values,this.ratings,this.steps,this.tags);

}