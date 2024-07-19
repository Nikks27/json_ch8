import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Modal/JsonModal.dart';

class TodoProvider extends ChangeNotifier
{
  List <Todo> TodoList =[];

  Future  JsonParsing()
  async {
    String Json = await rootBundle.loadString('');

    var Todo = jsonDecode();

  }
}