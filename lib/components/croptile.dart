// ignore_for_file: prefer_const_constructors

import 'package:first_ui/screens/addDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CropTile extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;
  final String price;
  final double height;
  final double width;
  final dynamic destination;
  const CropTile(
      {Key? key,
      required this.destination,
      required this.height,
      required this.width,
      required this.color,
      required this.title,
      required this.assetPath,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: height,
            width: width,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        assetPath,
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        title,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      Text(price, style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Get.to(destination);
        });
  }
}
