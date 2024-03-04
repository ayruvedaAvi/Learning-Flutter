import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 108, 0, 85),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 26, 47, 48),
  brightness: Brightness.dark,
);

void main() {
  //The following commented code is to lock the app's orientation.

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then(
  //   (fn) {
  runApp(
    MaterialApp(
      home: const Expenses(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.all(10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
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
      themeMode: ThemeMode.system, //Default
    ),
  );
  //   },
  // );
}
