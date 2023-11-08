import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.ansText, required this.func});
  final String ansText;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: Color.fromARGB(255, 50, 21, 67)),
        onPressed: func,
        child: Text(
          ansText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
