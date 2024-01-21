import 'package:flutter/material.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:provider/provider.dart';

AppBar customAppBar() {
  
  return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 32,
          height: 32,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 10,
                child: Container(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.arrow_back),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF7F8F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 32,
            height: 32,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF7F8F8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                Positioned(
                  left: 11,
                  top: 14,
                  child: Container(
                    width: 10,
                    height: 4,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: ShapeDecoration(
                              color: Color(0xFF1D1517),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 6,
                          top: -0,
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: ShapeDecoration(
                              color: Color(0xFF1D1517),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      title: Center(
        child: Text(
         "Profile" ,
          style: TextStyle(
            color: Color(0xFF1D1517),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
      ));
}
