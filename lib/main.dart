import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 15},
        {'text': 'Yellow', 'score': 20},
      ],
    },
    {
      'questionText': "How old are you?",
      'answers': [
        {'text': '<20', 'score': 5},
        {'text': '20-39', 'score': 10},
        {'text': '40-70', 'score': 15},
        {'text': '70+', 'score': 20},
      ],
    },
    {
      'questionText': "What is your favourite animal?",
      'answers': [
        {'text': 'dog', 'score': 15},
        {'text': 'cat', 'score': 5},
        {'text': 'my girlfriend', 'score': 25},
        {'text': 'raccooon', 'score': 135},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
