import 'package:flutter/material.dart';
import 'package:basic_quiz/start_screen.dart';

const start = Alignment.topLeft;
const end = Alignment.bottomRight;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(248, 255, 234, 0),
                Color.fromARGB(233, 170, 0, 142)
              ],
              begin: start,
              end: end,
            ),
          ),
          child: StartScreen(),
        ),
      ),
    ),
  );
}
