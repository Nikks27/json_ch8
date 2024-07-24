import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/geetamodel.dart';

class GeetaProvider extends ChangeNotifier {
  List<GeetaModel> geetaData = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/geeta.json');
    List users = jsonDecode(json);

    geetaData = users.map((e) => GeetaModel.fromJson(e),).toList();
    notifyListeners();
  }

  GeetaProvider() {
    jsonParsing();
  }


}
