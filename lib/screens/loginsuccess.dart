// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:first_ui/components/loginbutton.dart';
import 'package:first_ui/screens/home/home.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double getProportionateScreenWidth(double inputWidth) {
      // 812 is the layout height that designer use
      return (inputWidth / 812.0) * screenWidth;
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double getProportionateScreenHeight(double inputHeight) {
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight;
    }

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: screenHeight * 0.4, //40%
        ),
        SizedBox(height: screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
