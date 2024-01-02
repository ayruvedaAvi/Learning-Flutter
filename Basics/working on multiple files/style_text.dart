import 'package:flutter/material.dart';
class StyleText extends StatelessWidget{
  const StyleText({super.key});
  @override
  Widget build(context){
    return
      const Text(
          'This text is inside a custom widget on another file.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
      );
  }
}