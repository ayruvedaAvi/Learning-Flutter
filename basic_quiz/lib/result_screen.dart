import 'package:basic_quiz/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:basic_quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
    // print(chosenAnswer);

    for (var i = 0; i<chosenAnswer.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[3],
        'chosen_answer': chosenAnswer[i]
      });
    }
    return (summary);
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final totalQn = questions.length;
    final correctQn = summaryData.where((data){
      return (data['chosen_Answer'] == data['correct_Answer']);
    }).length;
    // print(summaryData.where((data){
    //   return (data['chosen_Answer'] == data['correct_Answer']);
    //   }
    // )); 

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Out of $totalQn questions, you correctly answered $correctQn questions."),
            const Text("The result are as follows: "),
            const SizedBox(height: 30,),
            // Scrollable list of questions and answers
            QuestionSummary(getSummaryData()), 
            const SizedBox(height: 30,),
            OutlinedButton(
              onPressed: () {}, 
              child: const Text("restart")
            ),
          ],
        ),
      ),
    );
  }
}