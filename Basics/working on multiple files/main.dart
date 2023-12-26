import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';    //connecting the other file containing gradient_container.dart
                                                      //First app is the name of the projectt. that is how you give a path

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(), 
      ),
    ),
  );
}

