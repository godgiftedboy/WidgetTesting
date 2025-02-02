import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:widget_test_demo/users/user_model.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/users",
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return List.from(jsonList).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("error");
    }
  }
}
