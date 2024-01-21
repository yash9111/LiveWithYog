import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:provider/provider.dart';
// Import the file where UserData class is defined

Future<bool> registerUser(BuildContext context) async {
  UserData userData = Provider.of<UserData>(context, listen: false);

  final String url = 'https://yogserver.onrender.com/auth/register';

  final Map<String, dynamic> data = {
    "username": userData.username,
    "password": userData.hashedPassword,
    "firstName": userData.firstName,
    "lastName": userData.lastName,
    "gender": userData.gender,
    "age": userData.age,
    "weight": userData.weight,
    "height": userData.height,
    "disease": userData.disease,
    "profession": userData.profession,
    "goal": userData.goal,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 201) {
      // Registration successful
      print('Registration successful');
      return true;
      // Handle success appropriately, e.g., navigate to another screen
    } else {
      // Registration failed
      print('Registration failed. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      // Handle error appropriately
    }
  } catch (error) {
    print('Error during registration: $error');
    // Handle error appropriately
  }
  return false;
}
