// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'result_screen.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  double height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('BMI Calculator'))),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _genderCard(Gender.male, Icons.male, "Male"),
                _genderCard(Gender.female, Icons.female, "Female"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: _boxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height", style: TextStyle(fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toInt().toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      const Text(" cm", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    onChanged: (val) {
                      setState(() {
                        height = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _numberControlCard("Weight", weight, () => setState(() => weight--), () => setState(() => weight++)),
                _numberControlCard("Age", age, () => setState(() => age--), () => setState(() => age++)),
              ],
            ),
          ),
          Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {
                double bmi = weight / ((height / 100) * (height / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResultScreen(bmi: bmi)),
                );
              },
              child: const Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: const Color(0xFF1D1E33),
      borderRadius: BorderRadius.circular(10),
    );
  }

  Expanded _genderCard(Gender gender, IconData icon, String label) {
    bool selected = gender == selectedGender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = gender),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: selected ? Colors.pinkAccent : const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _numberControlCard(String title, int value, VoidCallback onDecrement, VoidCallback onIncrement) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: _boxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            Text(value.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
                IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}