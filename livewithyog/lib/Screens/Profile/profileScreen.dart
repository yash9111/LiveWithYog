import 'package:flutter/material.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';
import 'package:provider/provider.dart';

class profileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    bool istoggle = false;
    return Scaffold(
      appBar: AppBar(
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
              "Profile",
              style: TextStyle(
                color: Color(0xFF1D1517),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with avatar, name, goal, and button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: userData.gender == "male"
                      ? AssetImage('assets/Images/maleUser.jpg')
                      : AssetImage(
                          "assets/Images/femaleUser.jpg"), // Add your image path
                  radius: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.firstName + " " + userData.lastName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "700kCal per Day",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                customButton(
                    text: "Edit", height: 40.0, width: 90.0, onClick: ())
              ],
            ),
            SizedBox(height: 20.0),
            // Row with 3 boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBox(userData.height.toString(), 'Height'),
                _buildBox(userData.weight.toString(), 'Weight'),
                _buildBox(userData.age.toString(), 'Age'),
              ],
            ),
            SizedBox(height: 20.0),
            // Account section
            Text(
              'Account',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildListItem(Icons.person, 'Gender'),
            _buildListItem(Icons.work, 'Profession'),
            _buildListItem(Icons.local_hospital, 'Diseases'),
            _buildListItem(Icons.calendar_today, 'Your Goal'),
            SizedBox(height: 20.0),
            // Notification section
            Text(
              'Notification',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // Row with icon, title, and toggle button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.notifications),
                Text('Pop-up Notification'),
                Switch(
                  value: istoggle, // Add your value
                  onChanged: (value) {
                    // Add onChanged functionality
                    istoggle = !istoggle;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for building each box
  Widget _buildBox(String text1, String text2) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0, // Adjust the blur radius as needed
              spreadRadius: 1.0, // Adjust the spread radius as needed
              offset: Offset(0, 1), // Offset of the shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Color.fromARGB(255, 165, 105, 229),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0.09,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Color(0xFF1D1517),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              height: 0.09,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for building each list item
  Widget _buildListItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_right),
    );
  }
}
