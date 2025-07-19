import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('BMI HomeScreen loads correctly', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(BMIApp());

    // Verify if BMI Calculator title appears
    expect(find.text('BMI Calculator'), findsOneWidget);

    // Verify if Calculate button appears
    expect(find.text('Calculate'), findsOneWidget);

    // Verify if height slider appears
    expect(find.byType(Slider), findsOneWidget);
  });
}
