import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:livewithyog/fakeHome.dart';

class congratulationsScreen extends StatelessWidget {
  const congratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset("assets/Vectors/Frame.svg"),
          Text(
            'Congratulations, You Have Finished Your Yoga ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1D1517),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'A Healthy Lifestyle Not Only Changes Your Body; \nIt Changes Your Mind, Your Attitude, And Your Mood ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF7B6F72),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 180,
          ),
          customButton(
              text: "Back to Home",
              height: 60.0,
              width: 315.0,
              onClick: fakeHomeScreen())
        ],
      ),
    );
  }
}
