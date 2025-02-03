import 'package:flutter/material.dart';
import 'package:widget_test_demo/users/user_model.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<UserModel>> futureUsers;

  const HomeScreen({
    super.key,
    required this.futureUsers,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: FutureBuilder(
          future: widget.futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<UserModel> userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
