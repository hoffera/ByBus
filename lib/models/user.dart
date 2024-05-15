import 'package:deep_pick/deep_pick.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: pick(json, "email").asStringOrThrow(),
      id: pick(json, "id").asStringOrThrow(),
      name: pick(json, "name").asStringOrThrow(),
      password: pick(json, "password").asStringOrThrow(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
