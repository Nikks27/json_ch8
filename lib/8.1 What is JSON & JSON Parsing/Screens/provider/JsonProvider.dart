import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Modal/JsonModal.dart';

class userProvider extends ChangeNotifier
{
  List<UserModal> UserList = [];

  Future <void> jsonParsing()
  async{
    String = await rootBundle.loadString('');
    List Users = jsonDecode(json);
    UserList = users.map((e))=> UserModal.fromjson(e),).toList();
notifyListeners();
  }
}