// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:html';

import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
// import 'package:fitness_tracker/Screens/HomeScreen/HmeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:awesome_bottom_bar/widgets/inspired/convex_shape.dart';

class tryBottom extends StatefulWidget {
  const tryBottom({super.key});

  @override
  State<tryBottom> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<tryBottom> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.black),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => {},
        backgroundColor: Color.fromRGBO(146, 163, 253, 1),
        child: SvgPicture.asset('assets/Icons/search_icon.svg'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: ConvexNotchedRectangle(
          notchSmoothness: NotchSmoothness.smoothEdge,
        ),
        // color: Colors.white,
        // elevation: 10,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(
            Icons.home,
            // color: Colors.amber,
          ),
          Icon(Icons.home),
          Icon(Icons.home),
          Icon(Icons.home),
        ]),
      ),
    );
  }
}
