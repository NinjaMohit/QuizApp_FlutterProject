import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question": "Who is the founder of Microsoft?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 2,
    },
    {
      "question": "Who is the founder of Apple?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 0,
    },
    {
      "question": "Who is the founder of Amazon?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
    },
    {
      "question": "Who is the founder of Tesla?",
      "options": ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      "answerIndex": 3,
    },
    {
      "question": "Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
    },
  ];
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;
  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestions[questionIndex]["answerIndex"]) {
      noOfCorrectAnswers += 1;
    }
    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Questions : ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${questionIndex + 1}/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[questionIndex]["question"],
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 0;
                  });
                }
              },
              child: Text(
                "A.${allQuestions[questionIndex]["options"][0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 1;
                  });
                }
              },
              child: Text(
                "B.${allQuestions[questionIndex]["options"][1]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 2;
                  });
                }
              },
              child: Text(
                "C.${allQuestions[questionIndex]["options"][2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: () {
                if (selectedAnswerIndex == -1) {
                  setState(() {
                    selectedAnswerIndex = 3;
                  });
                }
              },
              child: Text(
                "D.${allQuestions[questionIndex]["options"][3]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                "https://t3.ftcdn.net/jpg/02/80/01/64/360_F_280016442_I5DcWCRT7JTr5Ut86a9VvqNoOfDt854G.jpg",
                height: 250,
                width: 250,
              ),
              const Text(
                "Your Score Is",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "$noOfCorrectAnswers / ${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
