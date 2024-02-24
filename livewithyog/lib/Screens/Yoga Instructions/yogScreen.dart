import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Data/Models/yogaModel.dart';
import 'package:livewithyog/Screens/Yoga%20Instructions/congoScreen.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:livewithyog/Widgets/customButtonReplace.dart';

class yogScreen extends StatefulWidget {
  final Yoga yoga;
  const yogScreen({super.key, required this.yoga});

  @override
  State<yogScreen> createState() => _yogScreenState(yoga);
}

class _yogScreenState extends State<yogScreen> {
  Yoga yoga = Yoga(
      id: 1,
      englishName: "englishName",
      sanskritNameAdapted: "sanskritNameAdapted",
      sanskritName: "sanskritName",
      translationName: "translationName",
      poseDescription: "poseDescription",
      poseBenefits: "poseBenefits",
      urlSvg: "urlSvg",
      urlPng: "urlPng",
      urlSvgAlt: "urlSvgAlt");
  _yogScreenState(Yoga yoga) {
    this.yoga = yoga;
  }

  @override
  Widget build(BuildContext context) {
    List<String> steps = splitString(yoga.poseDescription);
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            "assets/Icons/Close-Navs.svg",
            height: 30,
            width: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(yoga.urlPng),
                Text(
                  yoga.englishName,
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  yoga.poseBenefits,
                  style: TextStyle(
                    color: Color(0xFF7B6F72),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Color(0xFF1D1517),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
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
                          text: yoga.sanskritName,
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
                      '${steps.length} Steps',
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
                Column(
                  children: steps.map((step) {
                    int index = steps.indexOf(step);
                    String sNo = "${index + 1}";

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
                        step,
                        style: TextStyle(
                          color: Color(0xFF7B6F72),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    customButtonReplace(
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

  List<String> splitString(String inputString) {
    // Split the inputString based on full stops
    List<String> result = inputString.split('.');
    print(result);
    if (result[result.length - 1].isEmpty) {
      // Remove any empty strings from the end of the list?
      result.removeLast();
    }
    return result;
  }
}
