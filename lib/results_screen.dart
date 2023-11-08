import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(this.response, {super.key});
  final List<Map<String, dynamic>> response;
  int correctnoofAnswers = 0;
  int totalQues = 0;
  void initState() {
    totalQues = response.length;
    for (int i = 0; i < response.length; i++) {
      if (response[i]["rightAns"] == response[i]["selectedAns"]) {
        correctnoofAnswers++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 70, 5, 145),
      ),
      child: Column(
        children: [
          ...response.map(
            (resItem) {
              return Text(
                  "You answered $correctnoofAnswers out of $totalQues questions correctly.",
                  style: TextStyle(color: Colors.black));
            },
          ),
        ],
      ),
    );
  }
}
