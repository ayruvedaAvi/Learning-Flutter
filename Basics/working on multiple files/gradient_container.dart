import 'package:flutter/material.dart';
import 'package:first_app/style_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
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
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyleText(),
      ),
    );
  }
}
