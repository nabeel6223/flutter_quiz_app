import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:quiz_app/quiz_screen.dart';

class landingPage extends StatelessWidget {
  const landingPage(this.SwitchScreen, {super.key});
  final void Function() SwitchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 70, 5, 145)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
              // height: 300,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Text("Learn Flutter the fun way!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: OutlinedButton.icon(
                onPressed: SwitchScreen,
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text(
                  "Start Quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
