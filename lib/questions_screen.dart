import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
// import GoogleFonts
import 'package:quiz_app/data/quiz_questions.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.chooseAnswer, {super.key});
  final void Function(String answer) chooseAnswer;

  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  // List<String> savedAnswers = [];
  void changeQues(String ans) {
    setState(() {
      currentQuestionIndex++;
    });
    widget.chooseAnswer(ans);
    // print(savedAnswers);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 70, 5, 145),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Text(currentQuestion.ques,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              ...currentQuestion.getShuffledanswers().map((answer) {
                return AnswerButton(
                  ansText: answer,
                  func: () {
                    changeQues(answer);
                  },
                );
              }),
            ],
          ),
        ));
  }
}
