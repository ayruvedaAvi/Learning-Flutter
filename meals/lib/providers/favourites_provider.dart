import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toogleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); //since we cannot use remove, we remove using this logic
          return false;
    } else {
      state = [
        ...state,
        meal
      ]; //since we cannot use add, we add using this logic
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>> ((ref) {
  return FavouriteMealsNotifier();
});
