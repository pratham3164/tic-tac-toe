import 'package:flutter/material.dart';

class BoardButton {
  int id;
  Color bg;
  String text;
  bool enabled; 
   BoardButton( {this.id,this.bg=Colors.grey,this.text="",this.enabled=true});
}