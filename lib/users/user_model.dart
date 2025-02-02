// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final int id;
  final String name;
  final String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      email: map['email'] ?? "",
    );
  }
}
