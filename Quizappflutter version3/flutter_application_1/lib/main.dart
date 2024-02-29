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
      question: " Android is ?",
      options: [
        "Operating system",
        "Web browser",
        "Processor",
        "Web server",
      ],
      answerIndex: 0,
    ),
    const SingleQuestionIndex(
      question: "    Flutter developed by ? ",
      options: ["Oracle", "Apple", "Google", "Facebook"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Android is based on which of the following language?",
      options: ["C++", "Python", "Java", "Swift"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Who invented Java Programming?",
      options: [
        "Chris Lattner",
        "James Gosling",
        "Dennis Ritchie",
        "Guido Rossum"
      ],
      answerIndex: 1,
    ),
    const SingleQuestionIndex(
      question: "What is the extension of java code files?",
      options: [" .js", ".txt", ".class", ".java"],
      answerIndex: 3,
    ),
  ];
  bool questionScreen1 = true;
  bool questionscreen2 = false;
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
        return const MaterialStatePropertyAll(
          Color.fromARGB(255, 212, 82, 232),
        );
      }
    } else {
      return const MaterialStatePropertyAll(
        Color.fromARGB(255, 212, 82, 232),
      );
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
      questionScreen1 = false;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen1 == true && questionscreen2 == false) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: Image.network(
                  "https://play-lh.googleusercontent.com/GVeQwvNq4vGgYajHeoMHFWD2ladHHzv17AfryJrAYQWXb69KkbbLpMyH07099fdAQFpz",
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionscreen2 = true;
                  });
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.black87)),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 212, 82, 232),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(200, 50)),
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (questionScreen1 == true && questionscreen2 == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 2),
                  width: 380,
                  height: 60,
                  child: Text(
                    " ${allQuestions[questionIndex].question}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
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
                    side: const MaterialStatePropertyAll(
                        BorderSide(width: 1, color: Colors.black87)),
                    backgroundColor: getColor(0),
                    fixedSize: const MaterialStatePropertyAll(Size(220, 35)),
                  ),
                  child: Text(
                    "A. ${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                      fontSize: 18,
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
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
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
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      backgroundColor: getColor(2),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
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
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      backgroundColor: getColor(3),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.network(
                "https://cdn.vectorstock.com/i/preview-1x/65/05/congratulations-greeting-card-vector-20026505.webp",
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Quiz Score Is",
                style: TextStyle(
                  fontSize: 40,
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
                questionScreen1 = true;
                questionscreen2 = false;
                correctAns = 0;
              });
            },
            backgroundColor: const Color.fromARGB(255, 212, 82, 232),
            child: const Icon(
              Icons.reset_tv,
              color: Colors.white,
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
