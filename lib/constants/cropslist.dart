// ignore_for_file: prefer_const_constructors

import 'package:first_ui/components/croptile.dart';
import 'package:first_ui/screens/addDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProducts {
  List topProductList = [
    CropTile(
      assetPath: 'assets/kiwi.png',
      color: Color(0xffDFECF8),
      price: '',
      title: 'Kiwi Fruit',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      destination: AddTaskPage(),
      color: Color(0xffF4DEF8),
      assetPath: 'assets/watermelo.png',
      title: 'Watermelon',
      price: '',
      height: 200,
      width: 500,
    ),
    CropTile(
      color: Color(0xffFFF2C5),
      assetPath: 'assets/strawberry.png',
      title: 'Strawberry',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Colors.greenAccent,
      assetPath: 'assets/brocolli.png',
      title: 'Strawberry',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      assetPath: 'assets/kiwi.png',
      color: Color(0xffDFECF8),
      price: '',
      title: 'Kiwi Fruit',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffF4DEF8),
      assetPath: 'assets/watermelo.png',
      title: 'Watermelon',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffFFF2C5),
      assetPath: 'assets/strawberry.png',
      title: 'Strawberry',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      assetPath: 'assets/kiwi.png',
      color: Color(0xffDFECF8),
      price: '',
      title: 'Kiwi Fruit',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      height: 200,
      width: 500,
      color: Color(0xffF4DEF8),
      assetPath: 'assets/watermelo.png',
      title: 'Watermelon',
      price: '',
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffFFF2C5),
      assetPath: 'assets/strawberry.png',
      title: 'Strawberry',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
  ];
}
