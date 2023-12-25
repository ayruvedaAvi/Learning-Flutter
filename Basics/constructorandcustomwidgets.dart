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
  GradientContainer({key}): super(key: key){            //adding a named arguement 'key' and assigning key (super means the parent class)
    // const GradientContainer({super.key})   this is a shortcut method to the previous line (const is added for runtime optimization)
    //It should be noted that const containers dont have a body.
    //Initialization on calling a constructor
  }

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
