// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:livewithyog/Screens/HomeScreen/HmeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:awesome_bottom_bar/widgets/inspired/convex_shape.dart';
import 'package:livewithyog/Screens/Profile/profileScreen.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;
  var screens = [homeScreen(), profileScreen(), homeScreen(), profileScreen()];
  var homeIcon = SvgPicture.asset('assets/Icons/Home-Active.svg');
  var profileIcon = SvgPicture.asset('assets/Icons/user_profile.svg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => {},
        backgroundColor: Color.fromRGBO(146, 163, 253, 1),
        child: SvgPicture.asset('assets/Icons/search_icon.svg'),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: ConvexNotchedRectangle(
          notchSmoothness: NotchSmoothness.smoothEdge,
        ),
        // color: Colors.white,
        // elevation: 10,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
              onTap: () {
                selectedIndex = 0;
                homeIcon = SvgPicture.asset('assets/Icons/Home-Active.svg');
                profileIcon = SvgPicture.asset('assets/Icons/user_profile.svg');
                setState(() {});
              },
              child: homeIcon),
          SvgPicture.asset('assets/Icons/activity_icon.svg'),
          SvgPicture.asset('assets/Icons/camera_icon.svg'),
          GestureDetector(
              onTap: () {
                selectedIndex = 3;
                profileIcon =
                    SvgPicture.asset('assets/Icons/Profile-Active.svg');
                homeIcon = SvgPicture.asset('assets/Icons/Home.svg');
                setState(() {});
              },
              child: profileIcon),
        ]),
      ),
    );
  }
}
