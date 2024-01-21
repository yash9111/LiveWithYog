import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String username = '';
  String hashedPassword = '';
  String firstName = '';
  String lastName = '';
  String gender = '';
  int age = 0;
  double weight = 0.0;
  double height = 0.0;
  String disease = '';
  String profession = '';
  String goal = '';

  void updateUserData({
    String? username,
    String? hashedPassword,
    String? firstName,
    String? lastName,
    String? gender,
    int? age,
    double? weight,
    double? height,
    String? disease,
    String? profession,
    String? goal,
  }) {
    this.username = username ?? this.username;
    this.hashedPassword = hashedPassword ?? this.hashedPassword;
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.gender = gender ?? this.gender;
    this.age = age ?? this.age;
    this.weight = weight ?? this.weight;
    this.height = height ?? this.height;
    this.disease = disease ?? this.disease;
    this.profession = profession ?? this.profession;
    this.goal = goal ?? this.goal;

    notifyListeners();
  }
}
