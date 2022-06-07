// ignore_for_file: prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:first_ui/constants/constants.dart';
import 'package:first_ui/news/lib/newspage.dart';
import 'package:first_ui/screens/home/categories.dart';
import 'package:first_ui/screens/home/homeheader.dart';
import 'package:first_ui/screens/home/profile.dart';
import 'package:first_ui/screens/weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/navigationbar.dart';
import '../../constants/colors.dart';
import 'reminder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double getProportionateScreenWidth(double inputWidth) {
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    double getProportionateScreenHeight(double inputHeight) {
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight;
    }

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Navigationbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              ReminderBanner(
                tscolor: Colors.white,
                color: Color(0xFF4A3298),
                upText: "Reminders",
                mainText: "There are no Reminders for today",
              ),
              Categories(),
              Weather(),
            ],
          ),
        ),
      ),
    );
  }
}
