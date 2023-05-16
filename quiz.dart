import 'package:flutter/material.dart';
import 'package:quiz_app/ques_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
    const Quiz({super.key});
    @override
    State<Quiz> createState(){
      return _QuizState();
    }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {       //setState executes the code in build method again
       activeScreen = 'question-screen';
    });
  }
  @override
  Widget build(context){
      return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[Color.fromARGB(255, 54, 15, 161),Color.fromARGB(255, 38, 6, 65)] ,
            begin : Alignment.topLeft, 
            end: Alignment.bottomRight,
              ), 
            ),
          child: activeScreen=='start-screen' 
          ? StartScreen(switchScreen)
          : const QuestionScreen()
          ),
      ),
    );
  }
}