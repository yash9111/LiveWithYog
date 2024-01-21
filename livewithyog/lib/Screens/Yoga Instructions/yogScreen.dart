import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Screens/Yoga%20Instructions/congoScreen.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';

class yogScreen extends StatefulWidget {
  const yogScreen({super.key});

  @override
  State<yogScreen> createState() => _yogScreenState();
}

class _yogScreenState extends State<yogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        actions: [
          SvgPicture.asset(
            "assets/Icons/Detail-Navs.svg",
            height: 40,
            width: 30,
          )
        ],
        leading: SvgPicture.asset(
          "assets/Icons/Close-Navs.svg",
          height: 30,
          width: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/Images/yog1.svg",
                  height: 200,
                ),
                Text(
                  'Viparita Karanai',
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Period cramps | Twice a day',
                  style: TextStyle(
                    color: Color(0xFF7B6F72),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Descriptions',
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 315,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Menstruation is not just something that people with a uterus experience for a few days each month. Our periods begin well before we see blood, in the form of period cramps and premenstrual ',
                          style: TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            // height: 0.12,
                          ),
                        ),
                        TextSpan(
                          text: 'Read More...',
                          style: TextStyle(
                            color: Color(0xFF92A3FD),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'How To Do It',
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                    Text(
                      '4 Steps',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFACA3A5),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.12,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                stepsList("1", "Spread Your legs",
                    "Sit onto a folded blanket and stretch your legs out in front of you. If your lower back is rounded, try piling more blankets beneath you or bend your knees"),
                stepsList("2", "Pile a block",
                    "Place the bolster perpendicularly across your thighs. Pile a block on top"),
                stepsList("3", "Adjust Props with blankets",
                    "Attempt to drape yourself over the props with your forehead on the block. If the props are too low, build them higher with more blankets and more blocks."),
                stepsList("4", "Let your arm relax",
                    "Your back will round, but we want to avoid any straining in the neck to do so. Let your arms relax by your sides."),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    customButton(
                        text: "Continue",
                        height: 60.0,
                        width: 315.0,
                        onClick: congratulationsScreen()),
                  ],
                )
              ],
            )),
      ),
    );
  }

  stepsList(String sNo, String title, String subTitle) {
    return ListTile(
      leading: Text(
        sNo,
        style: TextStyle(
          color: Color(0xFF1D1517),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF1D1517),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          color: Color(0xFF7B6F72),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
