import 'package:flutter/material.dart';
import 'package:fyp_career_road/components/bottomNavBar.dart';
import 'package:fyp_career_road/utilities/constants.dart';
import 'package:fyp_career_road/utilities/quiz_brain.dart';
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
  List<String> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        //Creating alert
        Alert(
          context: context,
          title: 'Finished!',
          // TODO: Add code to count which courseID is most present in list
          // and display its name
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //reset the questionNumber,
        quizBrain.reset();

        //empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //If we've not reached the end, ELSE do the answer checking steps below
      else {
        // adding user choice
        if (userPickedAnswer == true) scoreKeeper.add(correctAnswer);

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
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "This test will assist you in finding a career based on your interest.",
            textAlign: TextAlign.justify,
            style: kTitleStyle,
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 1.0,
        ),
        Text(
          (quizBrain.getQuestionNumber() + 1).toString() + "/" + quizBrain.getQuestionCount().toString(),
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
