import 'package:flutter/material.dart';
import 'package:question_answer_app/question_engine.dart';

QuestionEngine questionEngine = QuestionEngine();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  int correctCount = 0;
  int incorrectCount = 0;

  Future<void> _showDialog(
      String title, String bodyText, String buttonText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.blueGrey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // title: Text(
        //   title,
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
              children: [
            
                Image(
                    width: 150,
                    height: 150,
                    image: AssetImage("assets/congratsimage.png")),
               const  SizedBox(height: 10),
                     Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
                    ),
                Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context, 'OK');
                  questionEngine.reset();
                  score = 0;
                  correctCount = 0;
                  incorrectCount = 0;
                });
              },
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkAnswer(String userSelectedAnswer, int weightValue) {
    String correctAnswer = questionEngine.getCorrectAnswer();

    setState(() {
      if (questionEngine.didFinishQuiz()) {
        _showDialog("Congratulations!", "You have come to the end of the quiz",
            "Start Again");
      } else {
        if (userSelectedAnswer == correctAnswer) {
          correctCount++;
        } else {
          incorrectCount++;
        }
        score += weightValue;
        questionEngine.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        // color: Colors.transparent, // Make the container background transparent
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    questionEngine.getQuestionTextForCurrentQuestion(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    textColor: Colors.white,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        questionEngine.getAnswers()[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(questionEngine.getAnswers()[index],
                          questionEngine.getScoreFromAnswers()[index]);
                    },
                  ),
                );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Score: ',
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                      Text(
                        '$score',
                        style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Correct: ',
                        style: TextStyle(
                            color: Color(0xFF388E3C),
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                      Text(
                        '$correctCount',
                        style: const TextStyle(
                            color: Color(0xFF388E3C),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Incorrect: ',
                        style: TextStyle(
                            color: Color(0xFFE53935),
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      ),
                      Text(
                        '$incorrectCount',
                        style: const TextStyle(
                            color: Color(0xFFE53935),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
