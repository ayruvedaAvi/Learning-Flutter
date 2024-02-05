import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const textColor = Color.fromARGB(255, 255, 198, 198);

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Making the image transparent but computation heavy way
        // Opacity(
        //   opacity: 0.35,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(95, 248, 247, 250),   //making the image transparent, the A in the ARGB is for opacity
        ),
        const SizedBox(height: 80),
        Text(
          'Some Nepali General Knowledge Questions.',
          style: GoogleFonts.poorStory(
            color: const Color.fromARGB(255, 239, 228, 196),
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor,
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
          ),
          label: const Text("Start quiz"),
        )
      ]),
    );
  }
}
