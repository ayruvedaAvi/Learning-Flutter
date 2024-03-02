import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, groceries, fuel, others }

const categoryIcons = {
  Category.food: Icons.brunch_dining,
  Category.fuel: Icons.motorcycle,
  Category.groceries: Icons.local_grocery_store_outlined,
  Category.others: Icons.other_houses,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // Initializers can be used in dart to initialize class properties with values that are not received as constructor function arguements

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //creating a getter
  //we use a third party package called intl
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
