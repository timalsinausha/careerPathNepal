import 'package:flutter/material.dart';

class ResultCheck extends StatefulWidget {
  const ResultCheck({super.key});

  @override
  State<ResultCheck> createState() => _ResultCheckState();
}

class _ResultCheckState extends State<ResultCheck> {
  @override
  Widget build(BuildContext context) {
     print("Building ResultCheck");
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           debugPrint("Button Pressed");
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}