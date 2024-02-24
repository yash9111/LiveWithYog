import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livewithyog/Screens/Yoga%20Instructions/yogScreen.dart';

class fakeHomeScreen extends StatefulWidget {
  const fakeHomeScreen({super.key});

  @override
  State<fakeHomeScreen> createState() => _fakeHomeScreenState();
}

class _fakeHomeScreenState extends State<fakeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCustomDialog(context),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/Home.png"),
            fit: BoxFit.cover,
          ),
        ),
        // child: SvgPicture.asset("assets/Images/Home.png"),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog();
    },
  );
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
          child: Container(
            height: 550,
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(height: 16.0),
                ListTile(
                  onTap: () {
                    // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => yogScreen()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Periods Reminder",
                    style: TextStyle(
                      color: Color(0xFF1D1517),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "Try this Yoga to get relive in your period cramp",
                    style: TextStyle(
                      color: Color(0xFFACA3A5),
                      fontSize: 13,
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
      ],
    );
  }
}
