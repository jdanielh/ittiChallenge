// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  int id;
  String firstName;
  String lastName;
  String login;
  String email;
  String permissions;
  String authentication;

  Usermodel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.login,
    required this.email,
    required this.permissions,
    required this.authentication,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        login: json["login"],
        email: json["email"],
        permissions: json["permissions"],
        authentication: json["authentication"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "login": login,
        "email": email,
        "permissions": permissions,
        "authentication": authentication,
      };
}
