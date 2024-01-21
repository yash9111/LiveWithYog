// ignore_for_file: prefer_const_constructors

import 'package:livewithyog/Data/LoginAPi/registerUser.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Screens/Dashboard/BottomNavigation.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Goal.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Register.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Welcome.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:livewithyog/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class getInfoScreen extends StatefulWidget {
  const getInfoScreen({super.key});

  @override
  State<getInfoScreen> createState() => _getInfoScreenState();
}

class _getInfoScreenState extends State<getInfoScreen> {
  @override
  Widget build(BuildContext context) {
    String gender = "";
    String age = "";
    String weight = "";
    String height = "";
    String disease = '';
    String profession = '';
    String goal = '';

    return Scaffold(
      // color: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                height: 250,
                child: SvgPicture.asset('assets/Vectors/girl_vector.svg')),
            Text(
              "Let's complete your profile",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "It will help us to know more about you!",
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Color.fromRGBO(123, 111, 114, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            customTextField(
              hintText: "Choose Gender",
              icon: 'assets/Icons/2_user_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                gender = text;
              },
            ),
            customTextField(
              hintText: "Age",
              icon: 'assets/Icons/Calendar_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                age = text;
              },
            ),
            customTextField(
              hintText: "Your Weight",
              icon: 'assets/Icons/scale_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                weight = text;
              },
            ),
            customTextField(
              hintText: "Your Height",
              icon: 'assets/Icons/Swap_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                height = text;
              },
            ),
            customTextField(
              hintText: "Deseases",
              icon: 'assets/Icons/Swap_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                disease = text;
              },
            ),
            customTextField(
              hintText: "Professions",
              icon: 'assets/Icons/Swap_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                profession = text;
              },
            ),
            customTextField(
              hintText: "Goal",
              icon: 'assets/Icons/Swap_icon.png',
              isPassword: false,
              onTextChanged: (text) {
                // You can do something with the entered text here
                goal = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 315,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(146, 163, 253, 1))),
                  onPressed: () async {
                    UserData userData =
                        Provider.of<UserData>(context, listen: false);
                    // Update user data here
                    userData.updateUserData(
                      gender: gender,
                      age: int.parse(age),
                      weight: double.parse(weight),
                      height: double.parse(height),
                      disease: disease,
                      profession: profession,
                      goal: goal,
                    );
                    showLoader();
                    if (await registerUser(context)) {
                      hideLoader();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => welcomeScreen (),
                          ));
                    } else {
                      hideLoader();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ]),
        ),
      ),
    );
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
