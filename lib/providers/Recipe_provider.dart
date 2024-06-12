import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _savedRecipes = [];

  List<Recipe> get savedRecipes => _savedRecipes;

  void addRecipe(Recipe recipe) {
    if (_savedRecipes.contains(recipe)) {
      print("dont");
      notifyListeners();
    } else {
      _savedRecipes.add(recipe);
      print(_savedRecipes);
      notifyListeners();
    }

    notifyListeners();
  }

  void removeRecipe(Recipe recipe) {
    _savedRecipes.remove(recipe);
    notifyListeners();
  }

  checkSaved(Recipe recipe) {
    if (_savedRecipes.contains(recipe)) {
      return true;
    } else {
      return false;
    }
  }

  void update() {
    notifyListeners();
  }
}

extension ProviderOnContext on BuildContext {
  RecipeProvider get recipeProvider =>
      Provider.of<RecipeProvider>(this, listen: false);
}
