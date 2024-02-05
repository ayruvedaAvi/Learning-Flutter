import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary(this.summaryData, {super.key});
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(((data['question_index'] as int) + 1).toString(), style: GoogleFonts.workSans(
                    color: const Color.fromARGB(255, 255, 215, 215),
                    fontSize: 20,
                  ),),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String,
                            style: GoogleFonts.workSans(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        const SizedBox(height: 10),
                        Text(
                          data['chosen_answer'] as String,
                          style: GoogleFonts.workSans(
                            color: const Color.fromARGB(255, 249, 0, 112),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String, 
                        style: GoogleFonts.workSans(
                          color: const Color.fromARGB(255, 0, 106, 4)
                        )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
