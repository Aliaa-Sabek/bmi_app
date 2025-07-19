// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String getResultText() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) return "Normal";
    else if (bmi < 30) return "Overweight";
    else return "Obese";
  }

  String getDescription() {
    if (bmi < 18.5) {
      return "You are underweight. Try to eat more.";
    } else if (bmi < 25) return "You have a normal body weight. Good job!";
    else if (bmi < 30) return "You are overweight. Try to exercise more.";
    else return "You are obese. Consult with a doctor.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Your Result"))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getResultText(),
              style: const TextStyle(fontSize: 22, color: Colors.greenAccent),
            ),
            const SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              getDescription(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
              child: const Text("Re - Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
