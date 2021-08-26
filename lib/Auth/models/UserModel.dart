import 'package:flutter/material.dart';

class UserModel {
  String id;
  String email;
  String city;
  String country;
  String fName;
  String lName;
  String ImageUrl;
  UserModel({
    @required this.id,
    @required this.email,
    @required this.city,
    @required this.country,
    @required this.fName,
    @required this.lName,
    @required this.ImageUrl,
  });

  UserModel.fromMap(Map map) {
    this.id = map['id'];
    this.email = map['email'];
    this.city = map['city'];
    this.country = map['country'];
    this.fName = map['fName'];
    this.lName = map['lName'];
    this.ImageUrl = map['ImageUrl'];
  }
}