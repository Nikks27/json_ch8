import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Modal/8.3_Modal.dart';

class PostProvider extends ChangeNotifier
{
  late PostModal postModal;

  Future<void> jsonParsing()
  async {
    String json = await rootBundle.loadString('assets/post.json');
    final response = jsonDecode(json);
    postModal = PostModal.fromJson(response);
    notifyListeners();
  }

  PostProvider()
  {
    jsonParsing();
  }
}