import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 77, 64, 255),
                Color.fromARGB(255, 196, 15, 190)
              ],
              begin: Alignment.topLeft,
              end:Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Text('Hello world!', style: TextStyle(color: Colors.white,
            fontSize: 28,),),
          ),
        ),
      ),
    ),
  );
}
