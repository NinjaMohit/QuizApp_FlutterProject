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

class SingleQuestionIndex {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionIndex({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionIndex(
      question: "Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Who is the founder of Apple?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      answerIndex: 0,
    ),
    const SingleQuestionIndex(
      question: "Who is the founder of Amazon?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      answerIndex: 1,
    ),
    const SingleQuestionIndex(
      question: "Who is the founder of Tesla?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "ElonMusk"],
      answerIndex: 3,
    ),
    const SingleQuestionIndex(
      question: "Who is the founder of Google?",
      options: ["Steve Jobs", "Lary Page", "Bill Gates", "ElonMusk"],
      answerIndex: 1,
    ),
  ];
  bool questionScreen = true;
  int questionIndex = 0;
  int optionIndex = -1;
  int correctAns = 0;

  MaterialStateProperty<Color> getColor(int buttonNo) {
    if (optionIndex != -1) {
      if (buttonNo == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonNo == optionIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.blue);
      }
    } else {
      return const MaterialStatePropertyAll(Colors.blue);
    }
  }

  void validateNextPage() {
    if (optionIndex == allQuestions[questionIndex].answerIndex) {
      correctAns++;
    }

    if (optionIndex != -1) {
      if (questionIndex < allQuestions.length) {
        questionIndex++;
      }
    }
    optionIndex = -1;

    if (questionIndex == allQuestions.length) {
      questionScreen = false;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: BorderSide(width: .2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(15), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 81, 227, 222),
                  Color.fromARGB(255, 240, 122, 226),
                  Color.fromARGB(255, 15, 141, 200),
                  Color.fromARGB(255, 118, 182, 224),
                ],
                transform: GradientRotation(95),
              ),
            ),
          ),
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
                "  ${allQuestions[questionIndex].question}",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //----------------------------------Button1----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 0;
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: getColor(0),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "A. ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //----------------------------------Button2----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 1;
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: getColor(1),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "B. ${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //----------------------------------Button3----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 2;
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: getColor(2),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "C. ${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //----------------------------------Button4----------------------------------------------
            ElevatedButton(
              onPressed: () {
                if (optionIndex == -1) {
                  setState(() {
                    optionIndex = 3;
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: getColor(3),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 30))),
              child: Text(
                "D. ${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 166, 228),
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: BorderSide(width: 2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(15), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 81, 227, 222),
                  Color.fromARGB(255, 240, 122, 226),
                  Color.fromARGB(255, 15, 141, 200),
                  Color.fromARGB(255, 118, 182, 224),
                ],
                transform: GradientRotation(95),
              ),
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
                "$correctAns / ${allQuestions.length}",
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              questionIndex = 0;
              optionIndex = -1;
              questionScreen = true;
              correctAns = 0;
            });
          },
          child: const Text(
            "Reset",
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
