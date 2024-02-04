import 'package:flutter/material.dart';
import 'package:basic_quiz/start_screen.dart';
import 'package:basic_quiz/questions_screen.dart';

const start = Alignment.topLeft;
const end = Alignment.bottomRight;

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;

  //Adding initilization tasks. kinaki switchScreen is refrenced at the same time as the object is being created.
  //Anything inside the initState method will be initialized after the object is made. ONCE.
  @override
  void initState() { 
    activeScreen = StartScreen(switchScreen);
    super.initState(); 
  }

  void switchScreen(){
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(248, 255, 234, 0),
                Color.fromARGB(233, 170, 0, 142)
              ],
              begin: start,
              end: end
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}