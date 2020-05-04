import 'package:flutter/material.dart';
import 'package:flutter_quiz/QuizResult.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final questions = [
    {
      "question": "What is your favourite color?",
      "answers": ["Red", "Green", "Purple", "Red"]
    },
    {
      "question": "What is the color of the sky?",
      "answers": ["Orange", "White", "Blue", "Purple"]
    },
    {
      "question": "In which country do you live?",
      "answers": ["USA", "UK", "Nepal", "India"]
    }
  ];
  var _quizResult = [];
  var _questionIndex = 0;

  void _answerQuestion(answer) {
    if (_questionIndex < questions.length) {
//      var currentQuestionAndAnswer = {
//        "question": questions[_questionIndex]["question"],
//        "answer": answer
//      };
      var currentQuestionAndAnswer = [
        questions[_questionIndex]["question"],
        answer
      ];
      setState(() {
        _questionIndex++;
      });
      _quizResult.add(currentQuestionAndAnswer);
    }
//    print(_quizResult);
  }

  void _resetQuizIndex() {
//    print("=====================================");
//    var x = (_quizResult).map((result) {
//      return("${result[0]} ==> ${result[1]}");
//    }).toList();
//    print(x);
//    print("=====================================");
    setState(() {
      _questionIndex = 0;
      _quizResult = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Quiz",
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 35,
            ),
            padding: EdgeInsets.only(right: 30),
            onPressed: () {},
            tooltip: "About Us",
          ),
        ],
      ),
      body: _questionIndex <= questions.length - 1
          ? Column(
              children: <Widget>[
                Question(questions[_questionIndex]["question"]),
                ...(questions[_questionIndex]["answers"] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )
          : QuizResult(_quizResult),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          color: Colors.white,
          size: 35,
        ),
        onPressed: _resetQuizIndex,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
