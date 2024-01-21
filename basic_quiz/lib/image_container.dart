import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});
  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        width: 300,
        height: 300,
      ),
      const SizedBox(
        height: 50,
      ),
      const Text(
        "Learn Flutter the fun way!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      OutlinedButton(
        onPressed: () => {},
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          textStyle: const TextStyle(fontSize: 15),
        ),
        child: const Text("Start Quiz"),
      )
    ]);
  }
}
