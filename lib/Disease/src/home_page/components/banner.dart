import 'package:flutter/material.dart';

class ReminderBanner extends StatelessWidget {
  final Color color;
  final Color tscolor;
  final String upText;
  final String mainText;
  const ReminderBanner({
    required this.tscolor,
    required this.color,
    required this.upText,
    required this.mainText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double getProportionateScreenWidth(double inputWidth) {
      // 812 is the layout height that designer use
      return (inputWidth / 812.0) * screenWidth;
    }

    return Container(
      height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: tscolor),
          children: [
            TextSpan(text: upText),
            TextSpan(text: "\n"),
            TextSpan(
              text: mainText,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
