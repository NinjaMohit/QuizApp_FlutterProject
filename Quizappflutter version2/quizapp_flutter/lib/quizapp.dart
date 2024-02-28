import 'package:flutter/material.dart';

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
      question: "    Flutter developed by ? ",
      options: ["Oracle", "Apple", "Google", "Facebook"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Time Complexity of Merge Sort ?",
      options: ["O(nlogn)", "O(logn)", "O(n)", "O(1)"],
      answerIndex: 0,
    ),
    const SingleQuestionIndex(
      question: "Time Complexity of Binary Search ?",
      options: ["O(nlogn)", "O(logn)", "O(n)", "O(1)"],
      answerIndex: 1,
    ),
    const SingleQuestionIndex(
      question: "Time Complexity of Bubble Sort ?",
      options: ["O(nlogn)", "O(logn)", "O(1)", "O(n*n)"],
      answerIndex: 3,
    ),
    const SingleQuestionIndex(
      question: "Time Complexity of Quick Sort?",
      options: ["O(logn)", "O(nlogn)", "O(1)", "O(n*n)"],
      answerIndex: 1,
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
      questionScreen1 = false;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen1 == true && questionscreen2 == false) {
      return Scaffold(
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            side: BorderSide(width: 2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 240, 122, 226),
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                transform: GradientRotation(900),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQubEd90r4lUgESoZH1mw6G_eG1biaXETCPQQ&usqp=CAU",
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionscreen2 = true;
                  });
                },
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.black87)),
                  backgroundColor: getColor(0),
                  fixedSize: const MaterialStatePropertyAll(Size(200, 40)),
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
        bottomNavigationBar: const BottomAppBar(
          height: 40,
          color: Colors.blue,
          child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                'Developed By Mohit',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    } else if (questionScreen1 == true && questionscreen2 == true) {
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            side: BorderSide(width: 2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 240, 122, 226),
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                transform: GradientRotation(900),
              ),
            ),
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
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 16, right: 16, bottom: 22),
              padding: const EdgeInsets.only(
                  top: 25, right: 10, bottom: 1, left: 10),
              height: 420,
              width: 400,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(137, 196, 244, 180),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.black),
                  boxShadow: const []),
              child: Column(
                children: [
                  SizedBox(
                    width: 380,
                    height: 60,
                    child: Text(
                      " ${allQuestions[questionIndex].question}",
                      style: const TextStyle(
                        fontSize: 21,
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
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      backgroundColor: getColor(0),
                      fixedSize: const MaterialStatePropertyAll(Size(180, 30)),
                    ),
                    child: Text(
                      "A. ${allQuestions[questionIndex].options[0]}",
                      style: const TextStyle(
                        fontSize: 22,
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
                        fixedSize:
                            const MaterialStatePropertyAll(Size(180, 30))),
                    child: Text(
                      "B. ${allQuestions[questionIndex].options[1]}",
                      style: const TextStyle(
                        fontSize: 22,
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
                        fixedSize:
                            const MaterialStatePropertyAll(Size(180, 30))),
                    child: Text(
                      "C. ${allQuestions[questionIndex].options[2]}",
                      style: const TextStyle(
                        fontSize: 21,
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
                        fixedSize:
                            const MaterialStatePropertyAll(Size(180, 30))),
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
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 40,
          color: Colors.blue,
          child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                'Developed By Mohit',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            side: BorderSide(width: 2, color: Colors.black),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(25), child: SizedBox()),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 240, 122, 226),
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
                transform: GradientRotation(900),
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
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.reset_tv,
              color: Colors.white,
            )),
        bottomNavigationBar: const BottomAppBar(
          height: 40,
          color: Colors.blue,
          child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                'Developed By Mohit',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
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
