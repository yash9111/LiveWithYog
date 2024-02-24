// ignore_for_file: prefer_const_constructors

import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Screens/Dashboard/BottomNavigation.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Widgets/customButtonReplace.dart';
import 'package:livewithyog/fakeHome.dart';
import 'package:provider/provider.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    // Update user data here
    String name = userData.firstName;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
          SvgPicture.asset('assets/Vectors/man_women_vector.svg'),
          SizedBox(
            height: 40,
          ),
          Text("Welcome, ${name}",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1))),
          Text("You are all set now, let’s reach your goals together with us",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Color.fromRGBO(123, 111, 114, 1))),
          SizedBox(
            height: 225,
          ),
          // customButtonReplace(
          //     text: "Go To Home",
          //     height: 60.0,
          //     width: 315.0,
          //     onClick: bottomNavigation()),,

          Container(
            height: 60,
            width: 315,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(146, 163, 253, 1))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bottomNavigation(),
                      ));
                },
                child: Text(
                  "Go to Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
          )
        ]),
      ),
    );
  }
}
