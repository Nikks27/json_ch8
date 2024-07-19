import 'package:flutter/material.dart';

class Todo {
  late int id, Userid;
  late String Title;
  late bool Complated;

  Todo({required this.id,
    required this.Userid,
    required this.Title,
    required this.Complated});

  factory Todo.FromMap(Map m1)
  {
    return Todo(id: m1['id'], Userid: m1['Userid'], Title: m1['Title'], Complated: m1['Complated']);
  }

}
