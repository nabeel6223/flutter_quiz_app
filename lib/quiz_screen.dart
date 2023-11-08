import 'package:flutter/material.dart';
import 'package:quiz_app/landing_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizScreen> {
  Widget? activeScreen;
  List<Map<String, dynamic>> response = [];
  @override
  void initState() {
    activeScreen = landingPage(SwitchScreen);
    super.initState();
  }

  void SwitchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String ans) {
    int index = response.length;
    Map<String, dynamic> map = {
      "ques": questions[index].ques,
      "rightAns": questions[index].answers[0],
      "selectedAns": ans,
    };
    response.add(map);
    if (response.length == questions.length) {
      setState(() {
        // savedAnswers = [];
        activeScreen = ResultScreen(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
