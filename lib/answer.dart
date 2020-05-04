import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answer;
  final Function _answerHandler;
  Answer(this._answerHandler,this._answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.red,
        padding: EdgeInsets.all(15),
        child: Text(
          _answer,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed:  () => _answerHandler(_answer),
      ),
    );
  }
}
