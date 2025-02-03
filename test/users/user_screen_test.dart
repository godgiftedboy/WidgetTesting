import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_demo/users/user_model.dart';
import 'package:widget_test_demo/users/user_screen.dart';

void main() {
  testWidgets('Displays list of users', (tester) async {
    final users = [
      UserModel(id: 1, name: "raj", email: "raj@gmail.com"),
      UserModel(id: 2, name: "suraj", email: "suraj@gmail.com"),
    ];

    Future<List<UserModel>> mockFetchUser() async {
      await Future.delayed(const Duration(seconds: 1));
      return users;
    }

    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(
        futureUsers: mockFetchUser(),
      ),
    ));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    //pump and settle for Futures and Animations
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));
  });
}
