// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  final Color color;
  final String title;
  final String assetPath;

  const CategoriesTile(
      {Key? key,
      required this.color,
      required this.title,
      required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Image.asset(
            assetPath,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
