import 'dart:typed_data';

class profile {
  String username;
  String email;
  String imageurl;
  Uint8List image_memory;

  profile(this.image_memory,this.imageurl,this.email,this.username);

}