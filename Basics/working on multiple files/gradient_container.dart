import 'package:flutter/material.dart';
import 'package:first_app/style_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color, {super.key});
  final List<Color> color;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyleText("This text is inside a custom widget on another file."),
      ),
    );
  }
}
