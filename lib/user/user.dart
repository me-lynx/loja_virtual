import 'dart:convert';

class User {
  bool isNewUser = false;
  String? email;
  String? displayName;
  bool isEmailVerified = false;

  User({
    this.displayName,
    this.email,
    this.isEmailVerified = false,
    this.isNewUser = false,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) =>
      User(isNewUser: json["isNewUser"], email: json["email"]);
}
