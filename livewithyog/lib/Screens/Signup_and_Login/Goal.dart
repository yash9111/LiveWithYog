// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:livewithyog/Screens/Signup_and_Login/Welcome.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class goalScreen extends StatefulWidget {
  const goalScreen({super.key});

  @override
  State<goalScreen> createState() => _goalScreenState();
}

class _goalScreenState extends State<goalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              "What is your goal ?",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "It will help us to choose a best \nprogram for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Color.fromRGBO(123, 111, 114, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  goalCard(
                    vector: 'assets/Vectors/barbell_vector.svg',
                    titleText: "Improve Shape",
                    descText:
                        "I have a low amount of body fat and need / want to build more muscle",
                  ),
                  goalCard(
                    vector: 'assets/Vectors/jumping_vector.svg',
                    titleText: "Lean & Tone",
                    descText:
                        "I'm “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way",
                  ),
                  goalCard(
                    vector: 'assets/Vectors/running_vector.svg',
                    titleText: "Lose a Fat",
                    descText:
                        "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass",
                  ),
                ],
              ),
            ),
            customButton(
                text: "Confirm",
                height: 60.0,
                width: 315.0,
                onClick: welcomeScreen())
          ]),
        ),
      ),
    );
  }
}

class goalCard extends StatelessWidget {
  var vector;
  var titleText;
  var descText;
  goalCard({
    super.key,
    required this.vector,
    required this.titleText,
    required this.descText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(30),
      height: 490,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(146, 163, 253, 1)),
      child: Column(
        children: [
          SvgPicture.asset(vector),
          SizedBox(
            height: 10,
          ),
          Text(titleText,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1))),
          Divider(),
          Text(descText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Color.fromRGBO(255, 255, 255, 1))),
        ],
      ),
    );
  }
}
