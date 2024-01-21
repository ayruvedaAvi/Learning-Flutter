import 'package:flutter/material.dart';
import 'package:basic_quiz/image_container.dart';

const color = [
  Color.fromARGB(248, 0, 151, 45),
  Color.fromARGB(233, 170, 0, 142)
];
const start = Alignment.topLeft;
const end = Alignment.bottomRight;

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: start,
          end: end,
        ),
      ),
      child: const Center(
        child: ImageContainer(),
      ),
    );
  }
}
