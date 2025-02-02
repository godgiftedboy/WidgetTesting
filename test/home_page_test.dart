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
  });
}
