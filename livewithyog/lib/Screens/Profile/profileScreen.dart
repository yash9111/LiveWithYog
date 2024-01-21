import 'package:flutter/material.dart';
import 'package:livewithyog/Widgets/CustomAppBar.dart';
import 'package:livewithyog/Widgets/CustomButton.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar());
  }
}
