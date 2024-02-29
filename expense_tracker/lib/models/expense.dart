
import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum Category { food, travel, leisure, work}

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
}