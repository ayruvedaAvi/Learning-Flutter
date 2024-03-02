import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 108, 0, 85));

void main(){
  runApp(
    MaterialApp(
      home: const Expenses(),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onSecondaryContainer,
          foregroundColor: kColorScheme.secondaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.all(10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onPrimaryContainer,
            fontSize: 25,
          ),
        ),
      ),
    ),
  );
}