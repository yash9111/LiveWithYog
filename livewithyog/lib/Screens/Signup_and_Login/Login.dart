// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:livewithyog/Data/LoginAPi/checkLogin.dart';
import 'package:livewithyog/Screens/Dashboard/BottomNavigation.dart';
import 'package:livewithyog/Screens/Dashboard/trying.dart';
import 'package:livewithyog/Screens/Signup_and_Login/GetUserInfo.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Register.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:livewithyog/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:screen_loader/screen_loader.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50, right: 15, left: 15),
        child: Column(children: [
          Text(
            "Hey there,",
            style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
          ),
          Text(
            "Welcome Back",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          customTextField(
            hintText: "Email",
            icon: 'assets/Icons/email_logo.png',
            isPassword: false,
            onTextChanged: (text) {
              email = text;
              // You can do something with the entered text here
            },
          ),
          customTextField(
            hintText: "Password",
            icon: 'assets/Icons/lock_logo.png',
            isPassword: true,
            onTextChanged: (text) {
              password = text;

              // You can do something with the entered text here
            },
          ),
          SizedBox(
            height: 250,
          ),
          // customButton(
          //     text: "Login",
          //     height: 60.0,
          //     width: 315.0,
          //     onClick: bottomNavigation()
          //     // onClick: tryBottonm(),
          //     ),
          //Suggest me a widget to create a horizontal line in flutter?
          Container(
            height: 60.0,
            width: 315,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(146, 163, 253, 1))),
                onPressed: () async {
                  showLoader();
                  if (await checkLogin(email, password)) {
                    hideLoader();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bottomNavigation(),
                        ));
                  } else {
                    hideLoader();
                    email = "";
                    password = "";
                    setState(() {});
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
          ),

          SizedBox(
            height: 24,
          ),

          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Row(
              children: [
                Divider(
                  indent: 125,

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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don’t have an account yet?",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registerScreen()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                ))
          ]),
        ]),
      ),
    ));
  }

  void showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void hideLoader() {
    Navigator.of(context).pop();
  }
}
