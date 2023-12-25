import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(), 
      ),
    ),
  );
}
class GradientContainer extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
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
            child: Text('This text is inside a custom widget.', style: TextStyle(
              color: Colors.black,
              fontSize: 28,),),
          ),
        );
  }
}
