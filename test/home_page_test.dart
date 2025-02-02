import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_demo/home_page.dart';

void main() {
  testWidgets('home page ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MyHomePage(title: "Flutter Demo"),
      ),
    );
    final ctr = find.text('0');
    expect(ctr, findsOneWidget); //There is 0

    final ctr1 = find.text('1');
    expect(ctr1, findsNothing); //There is no 1

    final incrementBtn = find.byType(FloatingActionButton);
    await tester.tap(incrementBtn);
    await tester.pump(); //setState

    final ctr2 = find.text('1');
    expect(ctr2, findsOneWidget); //There is 1 after tap on increment

    final ctr3 = find.text('0');
    expect(ctr3, findsNothing); //There is no 0
  });
}
