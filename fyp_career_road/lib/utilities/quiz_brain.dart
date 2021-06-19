import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', '1'),
    Question('You can lead a cow down stairs but not up stairs.', '0'),
    Question('Approximately one quarter of human bones are in the feet.', '1'),
    Question('A slug\'s blood is green.', '0'),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', '1'),
    Question('It is illegal to pee in the Ocean in Portugal.', '1'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  int getQuestionCount() {
    return _questionBank.length;
  }

  void reset() {
    _questionNumber = 0;
  }
}
