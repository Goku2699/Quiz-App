import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
    const StartScreen(this.startQuiz,{super.key});
    final void Function() startQuiz;
    @override
    Widget build(context){
      return  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png', 
              width: 300,),
            ),
            const SizedBox(height: 30,),
            const Text('Learn Flutter the fun way!',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            ),
            const SizedBox(height: 20,),
            OutlinedButton.icon(onPressed: startQuiz, 
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white,
              backgroundColor: Colors.black,),
              icon: const Icon(Icons.arrow_right_alt_outlined),
              label: const Text('Start Quiz', 
                style: TextStyle(
                fontSize: 17
                ),
              ),
            ),
            
          ],
        
      ),
      );
    }
}