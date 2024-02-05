import 'package:basic_quiz/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {

  final void Function(String answer) onSelectAnswer;

  const QuestionsScreen({super.key, required this.onSelectAnswer});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var qnIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      qnIndex++;
      // print(qnIndex);
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[qnIndex];

    return SizedBox(
      width: double.infinity, // Means use as much width as you can.
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,    // The main axis in Column is the vertical axis so it is centered vertically.
          crossAxisAlignment: CrossAxisAlignment.stretch,  // Cross axix is the horizontal axis so it takes as much horizontal space as it can.
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.nunito(
                color: const Color.fromARGB(255, 255, 211, 211),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(                     // ... le list bhitra ko items lai individual comma seperated item banauchha
              (item) {
                return Answer(answer: item, onTap: (){
                  answerQuestion(item);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
