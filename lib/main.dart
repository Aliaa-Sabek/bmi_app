// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}