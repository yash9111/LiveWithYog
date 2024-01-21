import 'package:flutter/material.dart';
import 'package:livewithyog/Data/UserNotifier/userData.dart';
import 'package:livewithyog/Screens/Dashboard/BottomNavigation.dart';
import 'package:livewithyog/Screens/Yoga%20Instructions/yogScreen.dart';
import 'package:livewithyog/Screens/splashScreen.dart';
import 'package:livewithyog/fakeHome.dart';
import 'package:provider/provider.dart';

import 'Screens/Signup_and_Login/Register.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: registerScreen(),
      home: splashScreen(),
    );
  }
}
