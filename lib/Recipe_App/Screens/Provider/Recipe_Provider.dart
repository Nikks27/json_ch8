
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  RecipeHelper recipeHelper = RecipeHelper();
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromApi() async {
    final data = await recipeHelper.fetchDataFromApi();
    recipeModal = RecipeModal.fromJson(data);
    return recipeModal;
  }
}


class DetailRecipeProvider extends ChangeNotifier{
  int selectedPage = 0;

  void changePage(int value){
    selectedPage = value;
    notifyListeners();
  }
}