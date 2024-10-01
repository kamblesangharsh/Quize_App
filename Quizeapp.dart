import "package:flutter/material.dart";
//import "package:flutter/widgets.dart";

void main() {
  runApp(const quizapp());
}

// ignore: camel_case_types
class quizapp extends StatelessWidget {
  const quizapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizapp(),
    );
  }
}

class Quizapp extends StatefulWidget {
  const Quizapp({super.key});
  @override
  State createState() => _QuizappState();
}

class _QuizappState extends State {
  List<Map> question = [
    {
      "quw": "Who Is The Founder Of Microsoft?",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correct": 1
    },
    {
      "quw": "Who Is The Founder Of Apple?",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correct": 0
    },
    {
      "quw": "Who Is The Founder Of Google?",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correct": 2
    },
    {
      "quw": "Who Is The Founder Of SpaceX?",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correct": 3
    },
    {
      "quw": "Who Is The Founder Of Meta?",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Zucka"],
      "correct": 3
    },
  ];
  int score = 0;

  int slec = -1;
  WidgetStateProperty<Color?> check(int ans) {
    if (slec != -1) {
      if (ans == question[questionindex]["correct"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (slec == ans) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionpage = true;

  int questionindex = 0;
  @override
  Widget build(BuildContext context) {
    return isquestionscreen();
  }

  Scaffold isquestionscreen() {
    if (questionpage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QUIZ APP",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 66, 61, 61),
        ),
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 140,
              ),
              Text(
                "Question:${questionindex + 1}/${question.length}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 390,
            height: 50,
            child: Text(question[questionindex]["quw"],
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: check(0),
              ),
              onPressed: () {
                if (slec == -1) {
                  slec = 0;
                  if (slec == question[questionindex]["correct"]) {
                    score++;
                  }

                  setState(() {});
                }
              },
              child: Text("A.${question[questionindex]["option"][0]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: check(1),
              ),
              onPressed: () {
                if (slec == -1) {
                  slec = 1;
                  if (slec == question[questionindex]["correct"]) {
                    score++;
                  }

                  setState(() {});
                }
              },
              child: Text("B.${question[questionindex]["option"][1]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: check(2),
              ),
              onPressed: () {
                if (slec == -1) {
                  slec = 2;
                  if (slec == question[questionindex]["correct"]) {
                    score++;
                  }

                  setState(() {});
                }
              },
              child: Text("C.${question[questionindex]["option"][2]}"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: check(3),
              ),
              onPressed: () {
                if (slec == -1) {
                  slec = 3;
                  if (slec == question[questionindex]["correct"]) {
                    score++;
                  }

                  setState(() {});
                }
              },
              child: Text("D.${question[questionindex]["option"][3]}"),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (slec != -1) {
              if (questionindex < question.length - 1) {
                questionindex++;
              } else {
                questionpage = false;
              }

              slec = -1;
              setState(() {});
            }
          },
          child: const Icon(Icons.forward),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QUIZ END",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 240,
                width: 250,
                child: Image.asset(
                    "https://tse3.mm.bing.net/th?id=OIP.30z2Lgbnbj0P8H-BGn4bbAHaGc&pid=Api&P=0&h=220"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("SCORE: $score/5"),
            ],
          ),
        ),
      );
    }
  }
}
