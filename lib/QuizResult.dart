import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';

class QuizResult extends StatelessWidget {
  final List _quizResult;

  QuizResult(this._quizResult);

  TextStyle answerStyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "The Quiz has been Completed.",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Your Answers are : ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
//          _quizResult.length > 0
          ...(_quizResult).map((result) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Question(result[0]),
                Padding(
                  padding: const EdgeInsets.only(left:22),
                  child: Text(
                    result[1],
                    style: answerStyle(),
                  ),
                )
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
