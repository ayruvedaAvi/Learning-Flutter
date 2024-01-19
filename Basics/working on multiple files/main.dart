import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';    //connecting the file

void main() {
  const color = [
    Color.fromARGB(255, 255, 191, 64),
    Color.fromARGB(255, 196, 15, 190),
    Color.fromARGB(255, 22, 255, 5)
  ];
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(color), 
      ),
    ),
  );
}

