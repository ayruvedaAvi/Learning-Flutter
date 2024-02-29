
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();
enum Category { food, travel, leisure, work}
const categoryIcons ={
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title, 
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();       // Initializers can be used in dart to initialize class properties with values that are not received as constructor function arguements

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