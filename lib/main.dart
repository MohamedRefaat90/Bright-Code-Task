import 'package:flutter/material.dart';
import 'package:quiz_app/custom_btn.dart';
import 'package:quiz_app/custom_text_field.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  TextEditingController textController = TextEditingController();
  String answer = "140";
  bool? isCorrect;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Answer The Following Question:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const Center(
              child: Text("90  +  50 ", style: TextStyle(fontSize: 50))),
          const SizedBox(height: 20),
          CustomTextField(
              textEditingController: textController,
              placeholderText: "Enter Your Answer"),
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: () {
                debugPrint(textController.text);
                setState(() {
                  isCorrect = textController.text == answer ? true : false;
                });
              },
              child: const Text("Submit",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))),
          const SizedBox(height: 30),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isCorrect == null
                ? 1
                : isCorrect!
                    ? 1
                    : 0,
            child: CustomBTN(
                widget: const Text("True"),
                width: 200,
                radius: 10,
                color: Colors.green,
                press: () {}),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isCorrect == null
                ? 1
                : !isCorrect!
                    ? 1
                    : 0,
            child: CustomBTN(
                widget: const Text("False"),
                width: 200,
                radius: 10,
                color: Colors.red,
                press: () {}),
          ),
        ]),
      )),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
