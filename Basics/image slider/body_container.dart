import 'package:flutter/material.dart';
import 'package:image_slider/image_slider.dart';

final color1 = Color.fromARGB(255, 79, 0, 236);
final color2 = Color.fromARGB(255, 255, 0, 255);
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: ImageSlider(imageNames: [
          'dice-1.png',
          'dice-2.png',
          'dice-3.png',
          'dice-4.png',
          'dice-5.png',
          'dice-6.png'
        ]),
      ),
    );
  }
}
