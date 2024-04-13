import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);

    final isFavourite = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .toogleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added as favourite'
                      : 'Meal removed as favourite'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              },
              child: Icon(
                isFavourite ? Icons.star : Icons.star_border,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Ingredients",
            style: TextStyle(
              fontSize: 25,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            meal.ingredients.join('\n'),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Steps",
            style: TextStyle(
              fontSize: 25,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            meal.steps.join('\n-  '),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
