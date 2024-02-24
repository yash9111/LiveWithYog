import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Data/GetYogaDetailsFromNames/getYogaDetails.dart';
import 'package:livewithyog/Data/Models/yogaModel.dart';
import 'package:livewithyog/Screens/Yoga%20Instructions/yogScreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final getYogaDetail = getYogaDetails(); // Initialize the yoga details service

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
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
              "Today's Routine",
              style: TextStyle(
                color: Color(0xFF1D1517),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
          )),
      body: FutureBuilder<List<Yoga>>(
        future: getYogaDetail.fetchYogaPosesDetails(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No yoga poses available'));
          } else {
            // Display the list of yoga poses
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Yoga yoga = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(yoga.urlPng),
                  ),
                  title: Text(
                    yoga.englishName,
                    style: TextStyle(
                      color: Color(0xFF1D1517),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    'Time to Complete: 15 minutes',
                    style: TextStyle(
                      color: Color(0xFF1D1517),
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  trailing: IconButton(
                    icon: SvgPicture.asset("assets/Icons/iconsMore.svg"),
                    onPressed: () {
                      // Add your menu functionality here
                    },
                  ),
                  onTap: () {
                    // Add your navigation or handling logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => yogScreen(yoga: yoga),
                        ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
