import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(this.response, this.RestartQuiz, {super.key});
  final List<Map<String, dynamic>> response;
  final void Function() RestartQuiz;
  int correctnoofAnswers = 0;
  int totalQues = 0;
  // void initState() {
  //   totalQues = response.length;
  //   for (int i = 0; i < response.length; i++) {
  //     if (response[i]["rightAns"] == response[i]["selectedAns"]) {
  //       correctnoofAnswers++;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    totalQues = response.length;
    for (int i = 0; i < response.length; i++) {
      if (response[i]["rightAns"] == response[i]["selectedAns"]) {
        correctnoofAnswers++;
      }
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 70, 5, 145),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctnoofAnswers out of $totalQues correctly!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...response.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(100),
                                    shape: BoxShape.circle,
                                    color: item["rightAns"] ==
                                            item["selectedAns"]
                                        ? Color.fromARGB(255, 68, 212, 231)
                                        : Color.fromARGB(255, 228, 68, 231)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item["index"]),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["ques"],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        item["selectedAns"],
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 139, 110, 197)),
                                      ),
                                      Text(
                                        item["rightAns"],
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 63, 228, 66)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: OutlinedButton.icon(
                onPressed: RestartQuiz,
                icon: const Icon(Icons.restart_alt),
                label: const Text(
                  "Restart Quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
