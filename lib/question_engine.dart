import 'question.dart';

class QuestionEngine {
  int _questionNumber = 0;
  int correctAnswers = 0;

  final List<Question> _questionList = [
    Question(
      'What is the capital of Japan?',
      ['Tokyo', 'Seoul', 'Kobe', 'Osaka'],
      'Tokyo',
      [2,-1,-1,-1],
    ),
    Question(
      'Who was the first President of the United States?',
      ['John Adams', 'Abraham Lincoln', 'George Washington', 'Thomas Jefferson'],
      'George Washington',
     
      [-1,-1,2,-1],
    ),
    Question(
      'Which element has the chemical symbol "o"?',
      ['Ozone', 'Oxygen', 'Osmium', 'Obsidian'],
      'Oxygen',
      [-1,2,-1,-1],
    ),
    Question(
      'What is the longest river in the world?',
      ['Amazon River', 'Nile River', 'Ganga', 'Yangtze River'],
      'Nile River',
      [-1,2,-1,-1],
    ),
    Question(
      ' Who was the 16th President of the United States',
      ['Franklin Pierce', 'Andrew Johnson', 'Donald Trum', 'Abraham Lincoln'],
      'Abraham Lincoln',
      [-1,-1,-1,2],
    ),
    Question(
      'What is the smallest bone in the human body?',
      ['Radius', 'Nasal', 'Stapes', 'Femur'],
      'Stapes',
      [-1,-1,2,-1],
    ),
    Question(
      'Which country is the largest producer of coffee in the world',
      ['Colombia', 'Chile', 'Vietnam', 'Brazil'],
      'Brazil',
      [-1,-1,-1,2],
    ),
    Question(
      'In which year did the Titanic sink',
      ['1895', '1921', '1912', '1920'],
      '1912',
      [-1,-1,2,-1],
    ),
    Question(
      'Which city is known as the" Eternal City"?',
      ['Athens', 'Cairo', 'Rome', 'Paris'],
      'Rome',
      [-1,-1,2,-1],
    ),
    Question(
      ' What is the name of the first artificial Earth satellite?',
      ['Apollo 11', 'Hubble Space Telescope', 'Sputnik 1', 'Voyager 1'],
      'Sputnik 1',
      [1,-1,2,-1],
    ),
  ];

  int getQuestionsCount() {
    return _questionList.length;
  }

  void nextQuestion() {
    if(_questionNumber < _questionList.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionTextForCurrentQuestion() {
    return _questionList[_questionNumber].questionText;
  }

  List<String> getAnswers() {
    return _questionList[_questionNumber].answersList;
  }

  List<int> getScoreFromAnswers() {
    return _questionList[_questionNumber].answerWeight;
  }

  String getCorrectAnswer() {
    return _questionList[_questionNumber].correctAnswer;
  }

  bool didFinishQuiz() {
    return _questionNumber >= _questionList.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

}