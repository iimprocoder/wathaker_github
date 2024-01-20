import 'package:flutter/material.dart';

class Duaa {
  int? id;
  String? name;
  Duaa({this.id, this.name});
}

class DuaData {
  String? id;
  String? text;
  int? iterations;

  DuaData({@required this.id, @required this.text, @required this.iterations});
}
