import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answer;
  final Function _answerHandler;
  Answer(this._answerHandler,this._answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          _answer,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: _answerHandler,
      ),
    );
  }
}
