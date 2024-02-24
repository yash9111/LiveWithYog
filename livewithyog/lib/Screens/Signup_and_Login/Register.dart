// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

// import 'dart:ffi';

import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Screens/Music/musicScreen.dart';
import 'package:livewithyog/Screens/Signup_and_Login/GetUserInfo.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Login.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:livewithyog/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

String firstName = "";
String lastName = "";
String username = "";
String password = "";

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 50),
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  customTextField(
                    hintText: "First Name",
                    icon: 'assets/Icons/user_logo.png',
                    isPassword: false,
                    onTextChanged: (text) {
                      // You can do something with the entered text here
                      firstName = text;
                    },
                  ),
                  customTextField(
                    hintText: "Last Name",
                    icon: 'assets/Icons/user_logo.png',
                    isPassword: false,
                    onTextChanged: (text) {
                      // You can do something with the entered text here
                      lastName = text;
                    },
                  ),
                  customTextField(
                    hintText: "Email",
                    icon: 'assets/Icons/email_logo.png',
                    isPassword: false,
                    onTextChanged: (text) {
                      // You can do something with the entered text here
                      username = text;
                    },
                  ),
                  customTextField(
                    hintText: "Password",
                    icon: 'assets/Icons/lock_logo.png',
                    isPassword: true,
                    onTextChanged: (text) {
                      // You can do something with the entered text here
                      password = text;
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                          print(isChecked);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              isChecked = !isChecked;
                              // print(isChecked);
                              // });
                            },
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color.fromRGBO(173, 164, 165, 1)),
                              ),
                              child: isChecked
                                  ? Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 10,
                                        color: Colors
                                            .black, // Add the color for the check icon
                                      ),
                                    )
                                  : null, // Render nothing if not checked
                            ),
                          ),
                          Text(
                            "By continuing you accept our Privacy Policy\n and Term of Use",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: Color.fromRGBO(173, 164, 165, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: 315,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: isChecked
                                ? MaterialStatePropertyAll(
                                    Color.fromRGBO(146, 163, 253, 1))
                                : MaterialStatePropertyAll(
                                    Color.fromRGBO(146, 163, 253, 0.5))),
                        onPressed: isChecked
                            ? () {
                                UserData userData = Provider.of<UserData>(
                                    context,
                                    listen: false);
                                userData.updateUserData(
                                  username: username,
                                  hashedPassword: password,
                                  firstName: firstName,
                                  lastName: lastName,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => getInfoScreen(),
                                    ));
                              }
                            : null,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  //Suggest me a widget to create a horizontal line in flutter?
                  SizedBox(
                    height: 24,
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      children: [
                        Divider(
                          indent: 141,

                          color: Colors.black, // Specify the color of the line
                          height: 1, // Specify the height of the line
                          thickness: 1, // Specify the thickness of the line
                        ),
                        Text(
                          "Or",
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/Icons/google_logo.png'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        child: Image.asset('assets/Icons/fB_logo.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginScreen()));
                          },
                          child: Text(
                            "Login",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
