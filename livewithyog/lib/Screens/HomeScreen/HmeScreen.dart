import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livewithyog/Data/GetTips/getTips.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Screens/HomeScreen/Progress.dart';
import 'package:livewithyog/Screens/Music/musicScreen.dart';
import 'package:livewithyog/Screens/Notifications/notificationScreen.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late Future<String> tipFuture; // Define a future to store the tip

  // Update user data here

  @override
  void initState() {
    super.initState();
    tipFuture = getTips(); // Call the getTips function to fetch the tip
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
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
                ),
              ),
            ),
            Text(
              userData.firstName + " " + userData.lastName,
              style: TextStyle(
                color: Color(0xFF1D1517),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                showCustomDialog(context);
              },
              child: SvgPicture.asset(
                "assets/Icons/notification_icon.svg",
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'May we make a suggestion?',
                  style: TextStyle(
                    color: Color(0xFFACA3A5),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(146, 163, 253, 0.7),
                  // ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(-1.00, 0.08),
                      end: Alignment(1, -0.08),
                      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                    ),
                  ),
                  child: FutureBuilder(
                    future: tipFuture, // Pass the future to the FutureBuilder
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        var data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image(
                                image: AssetImage("assets/Vectors/food.png"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tip of the Day",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      snapshot.hasData
                                          ? snapshot.data
                                          : data, // Use the tip from the snapshot
                                      softWrap: true,
                                      maxLines:
                                          6, // Set maxLines to limit the text to a single line
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w100,
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Activity Status",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vectors/bgHome.png")),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Calories Burn",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "700 kCal/per day",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () => {},
                                  child: Text("View More")),
                              // customButton(
                              //     text: "View More",
                              //     height: 40.0,
                              //     width: 70.0,
                              //     onClick: SongsApp())
                            ]),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10, bottom: 20),
                        child: CustomCircularProgress(
                          progress: 0.5,
                        ),
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: 315,
                //   height: 81,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         left: 0,
                //         top: 0,
                //         child: Opacity(
                //           opacity: 0.20,
                //           child: Container(
                //             width: 315,
                //             height: 81,
                // decoration: ShapeDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment(-1.00, 0.08),
                //     end: Alignment(1, -0.08),
                //     colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                //   ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(16),
                // ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         left: 20,
                //         top: 25.58,
                //         child: Container(
                //           child: Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   Text(
                //                     'CLASS',
                //                     style: TextStyle(
                //                       color: Color(0xFFACA3A5),
                //                       fontSize: 16,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w600,
                //                     ),
                //                   ),
                //                   Text(
                //                     '30 mins  Level 1-2',
                //                     style: TextStyle(
                //                       color: Color(0xFFACA3A5),
                //                       fontSize: 10,
                //                       fontFamily: 'Poppins',
                //                       fontWeight: FontWeight.w400,
                //                     ),
                //                   )
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150,
                    // width: double.infinity,
                    // margin: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Vectors/progress.png")),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(-1.00, 0.08),
                        end: Alignment(1, -0.08),
                        colors: [
                          Color.fromRGBO(146, 164, 253, 0.484),
                          Color.fromRGBO(157, 206, 255, 0.493),
                        ],
                      ),
                    ),
                    // child: Row(
                    //   children: [
                    //     Column(
                    //       // crossAxisAlignment: CrossAxisAlignment.,
                    //       children: [
                    //         Text(
                    //           'My Goals',
                    //           style: TextStyle(
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w600,
                    //               fontFamily: "Poppins"),
                    //         ),
                    //         SizedBox(height: 10),
                    //         Container(
                    //           height: 10,
                    //           child: LinearProgressIndicator(
                    //             value: 0.5, // adjust the value accordingly
                    //             backgroundColor: Colors.white,
                    //             valueColor: AlwaysStoppedAnimation<Color>(
                    //                 Color.fromRGBO(182, 201, 247, 1)),
                    //           ),
                    //         ),
                    //         SizedBox(height: 10),
                    //         Text(
                    //           '0 of 1 goal classes completed this week',
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         CircleAvatar(
                    //           radius: 30,
                    //           backgroundImage: AssetImage(
                    //               'assets/avatar.jpg'), // adjust the image path
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog();
      },
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Expanded(
            child: Container(
              // height: 950, // Reduced height for demonstration
              // width: 450,
              height: double.infinity,
              width: double.infinity,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(height: 16.0),
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()));
                    },
                    title: Text(
                      "Your daily routine has been updated ",
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      "Click here to get started",
                      style: TextStyle(
                        color: Color(0xFFACA3A5),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context); // Close the dialog
                      // You can navigate to your desired screen here
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => YourScreen()));
                    },
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(
                      "Welcome ${userData.firstName}🥳",
                      style: TextStyle(
                        color: Color(0xFF1D1517),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      "Lets work on your goal together!",
                      style: TextStyle(
                        color: Color(0xFFACA3A5),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
