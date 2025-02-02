import 'package:flutter/material.dart';
import 'package:widget_test_demo/users/user_model.dart';
import 'package:widget_test_demo/users/user_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserRepository userRepository = UserRepository();
  late Future<List<UserModel>> futureUsers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUsers = userRepository.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: FutureBuilder(
          future: futureUsers,
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
