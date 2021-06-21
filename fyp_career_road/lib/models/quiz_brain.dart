import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Have interest in automating things intelligently ', 'AI/ML'),
    Question('Like to play with data.', 'AI/ML'),
    Question('Ever dreamed of making machines as efficient as human.', 'AI/ML'),
    Question('Have interest in gaming and characters ', 'Game Development'),
    Question('Like to design characters.', 'Game Development'),
    Question('Love to design and innovate envirment  ', 'Game Development'),
    Question('Like to design user interfaces ', 'Development'),
    Question('Are u coding geek ', 'Development'),
    Question('Can u work continuously and efficiently ', 'Development'),
    Question('Are you a perfectionist', 'Quality Assurance'),
    Question('Love to find bugs and filter out things', 'Quality Assurance'),
    Question(
        'Think about all possibilities of a situation', 'Quality Assurance')
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

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
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
