import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/models/constants.dart';
import 'package:fyp_career_road/models/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    quizBrain.reset();

    int _bottomNavIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz')),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kBackgroundColor,
      body: QuizPage(),
      bottomNavigationBar: BottomNavBar(bottomNavIndex: _bottomNavIndex),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Map<String, int> scoreKeeper = {};

  void checkAnswer(bool userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // adding user choice
      if (userPickedAnswer == true) {
        if (scoreKeeper.containsKey(correctAnswer))
          scoreKeeper[correctAnswer] = scoreKeeper[correctAnswer] + 1;
        else
          scoreKeeper[correctAnswer] = 1;

        //If we've not reached the end, ELSE do the answer checking steps below
        if (quizBrain.isFinished()) {
          int max = -1;
          List<String> answer = ["Go to Army"];
          print(scoreKeeper.keys);
          for (var k in scoreKeeper.keys) {
            print("$k ${scoreKeeper[k]} max:$max");

            if (scoreKeeper[k] > 0 && scoreKeeper[k] == max) {
              answer.add(k);
            } else if (scoreKeeper[k] > max) {
              max = scoreKeeper[k];

              answer.clear();
              answer.add(k);
            }
          }
          //Creating alert
          Alert(
            context: context,
            title: 'Result!',
            content: Text("Try $answer"),
          ).show();

          //reset the questionNumber,
          quizBrain.reset();

          //empty out the scoreKeeper.
          scoreKeeper = {};
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "This test will assist you in finding a career based on these question.",
            textAlign: TextAlign.justify,
            style: kTitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Divider(
            color: Colors.white,
            thickness: 1.0,
          ),
        ),
        Text(
          (quizBrain.getQuestionNumber() + 1).toString() +
              "/" +
              quizBrain.getQuestionCount().toString(),
          textAlign: TextAlign.center,
          style: kTitleStyle,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            quizBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: kTitleStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.white,
              color: Colors.greenAccent,
              child: Text(
                'True',
                style: kLabelStyle,
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              color: Colors.redAccent,
              child: Text(
                'False',
                style: kLabelStyle,
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ],
        ),
      ],
    );
  }
}
