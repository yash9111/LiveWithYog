// import 'dart:js';/

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:provider/provider.dart';

Future<bool> checkLogin(
    String username, String password, BuildContext context) async {
  final String url = 'https://yogserver.onrender.com/auth/login';

  final Map<String, dynamic> data = {
    "username": username,
    "password": password,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Login successful
      Map<String, dynamic> responseBody = json.decode(response.body);
      String token = responseBody['token'];
      Map<String, dynamic> user = responseBody['user'];

      // Do something with the token, e.g., store it for future API requests
      print('Login successful. Token: $token');
      // Update user data using Provider
      UserData userData = Provider.of<UserData>(context, listen: false);
      userData.updateUserData(
        username: user['username'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        gender: user['gender'],
        age:int.parse( user['age']),
        weight: double.parse(user['weight']),
        height: user['height'],
        disease: user['disease'],
        profession: user['profession'],
        goal: user['goal'],
      );

      return true;
    } else {
      // Login failed
      print('Login failed. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      // Handle error appropriately
    }
  } catch (error) {
    print('Error during login: $error');
    // Handle error appropriately
  }
  return false;
}
