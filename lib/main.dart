import 'package:flutter/material.dart';
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
  var _questionIndex = 0;

  void _answerQuestion() {
    print(_questionIndex);
    setState(() {
      _questionIndex >= 1 ? _questionIndex = 0 : _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "question": "What is your favourite color",
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
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Question(questions[_questionIndex]["question"]),
          Answer(_answerQuestion, "Answer 1"),
          Answer(_answerQuestion, "Answer 2"),
          Answer(_answerQuestion, "Answer 3"),
          Answer(_answerQuestion, "Answer 4"),
        ],
      ),
    );
  }
}
