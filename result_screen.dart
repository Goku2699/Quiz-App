import 'package:flutter/material.dart';
//import 'package:quiz_app/ques_screen.dart';
//import 'package:quiz_app/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/question_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.chosenAns,
  required this.onRestart});

  final List<String> chosenAns;
  final void Function() onRestart;
  List<Map<String,Object>> getSummaryData(){
      List<Map<String,Object>> summary = [];

      for(var i =0;i<chosenAns.length;i++){
          summary.add({
            'question_index' : i,
            'question' : questions[i].text,
            'correct_answer' : questions[i].answers[0],
            'user_answer' : chosenAns[i],
          });
      }

    return summary;
  }
   @override
   Widget build(context){
     final summaryData = getSummaryData();
     final numTotalques = questions.length;
     final numCorrectques = summaryData.where((data) {
       return data['user_answer']==data['correct_answer'];
     }).length;

      return SizedBox(
         width: double.infinity, 
         child: Container(
           margin: const EdgeInsets.all(30),
           child: Column(
             mainAxisAlignment : MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [   
              Text('You answered $numCorrectques out of $numTotalques correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(240, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ), 
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              QuestionSummary(summaryData),
              const SizedBox(height: 20,),
              TextButton.icon(onPressed: onRestart, 
              style: TextButton.styleFrom(
                foregroundColor:const Color.fromARGB(255, 140, 150, 0),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh Quiz'),
               )
              
           ],),
         ),
       );
   }
}
