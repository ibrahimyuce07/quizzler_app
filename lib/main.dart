import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> _scoreKeeper = [];
  List<Question> _questionBank = [
    Question("You can lead a cow down stairs but not up stairs.", false),
    Question("Approximately one quarter of human bones are in the feet.", true),
    Question("A slug's blood is green.", true)
  ];
  int tracker = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _questionBank[tracker].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = _questionBank[tracker].questionAnswer;

                if (correctAnswer) {
                  _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                } else {
                  _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                }

                setState(() {
                  if (tracker < 2) {
                    tracker++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              enableFeedback: false,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctAnswer = _questionBank[tracker].questionAnswer;
                if (!correctAnswer) {
                  _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                } else {
                  _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                }
                setState(() {
                  if (tracker < 2) {
                    tracker++;
                  }
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: _scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
