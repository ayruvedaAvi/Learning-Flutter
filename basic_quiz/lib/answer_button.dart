import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        foregroundColor: const Color.fromARGB(255, 19, 1, 49),
        backgroundColor: const Color.fromARGB(255, 156, 93, 131),
      ),
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
