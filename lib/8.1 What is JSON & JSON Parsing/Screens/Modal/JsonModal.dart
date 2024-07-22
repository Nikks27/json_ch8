import 'package:flutter/material.dart';

class UserModal
{
  late int id;
  late String name,username,email,phone;

}

class Address
{
  late String street,city,suit,zipcode;
  late Geo geo;

  factory Address fromjson(map m1)
  {
    return Address
  }
}

class Geo
{

}



