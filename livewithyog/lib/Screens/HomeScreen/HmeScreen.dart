import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          // leadingWidth: 300,

          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Welcome Back,',
                  style: TextStyle(
                    color: Color(0xFFACA3A5),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    // height: 0.12,
                  ),
                ),
              ),
              Text(
                'Stefani Wong',
                style: TextStyle(
                  color: Color(0xFF1D1517),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  // height: 0.07,
                ),
              )
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  "assets/Icons/notification_icon.svg",
                  width: 30,
                  height: 30,
                ))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'May we make a suggestion?',
              style: TextStyle(
                color: Color(0xFFACA3A5),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.09,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/Images/girlYog.png"),
            SizedBox(height: 30),
            Container(
              width: 315,
              height: 81,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Opacity(
                      opacity: 0.20,
                      child: Container(
                        width: 315,
                        height: 81,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(-1.00, 0.08),
                            end: Alignment(1, -0.08),
                            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 25.58,
                    child: Container(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'CLASS',
                              style: TextStyle(
                                color: Color(0xFFACA3A5),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.09,
                              ),
                            ),
                            Text(
                              '30 mins  Level 1-2',
                              style: TextStyle(
                                color: Color(0xFFACA3A5),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.15,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SvgPicture.asset("assets/Images/Banner.svg"),
          ]),
        ),
      ),
    );
  }
}
