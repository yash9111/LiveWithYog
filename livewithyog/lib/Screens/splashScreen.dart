import 'package:flutter/material.dart';
import 'package:livewithyog/Screens/Signup_and_Login/Register.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Livewith',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Y',
                      style: TextStyle(
                        color: Color(0xFFCC8FED),
                        fontSize: 50,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'og',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Text(
                  'Healthy Life with Yoga',
                  style: TextStyle(
                    color: Color(0xFF7B6F72),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: customButton(
                text: "Get Started",
                height: 60.0,
                width: 315.0,
                onClick: registerScreen()),
          )
        ],
      )),
    );
  }
}
