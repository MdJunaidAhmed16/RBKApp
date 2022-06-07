// ignore_for_file: prefer_const_constructors

import 'package:first_ui/components/croptile.dart';
import 'package:first_ui/screens/addDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProducts {
  List topProductList = [
    CropTile(
      assetPath: 'assets/paddy.jpg',
      color: Color(0xffDFECF8),
      price: '',
      title: 'Paddy',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      destination: AddTaskPage(),
      color: Color(0xffF4DEF8),
      assetPath: 'assets/maize.jpg',
      title: 'Maize',
      price: '',
      height: 200,
      width: 500,
    ),
    CropTile(
      color: Color(0xffFFF2C5),
      assetPath: 'assets/wheat.png',
      title: 'Wheat',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Colors.greenAccent,
      assetPath: 'assets/sugar.jpg',
      title: 'Sugar Cane',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffDFECF8),
      assetPath: 'assets/cotton.jpg',
      title: 'Cotton',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffF4DEF8),
      assetPath: 'assets/groundnut.jpg',
      title: 'Ground nuts',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Colors.greenAccent,
      assetPath: 'assets/greengram.jpg',
      title: 'Green Gram',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
    CropTile(
      color: Color(0xffFFF2C5),
      assetPath: 'assets/jowar.jpg',
      title: 'Jowar',
      price: '',
      height: 200,
      width: 500,
      destination: AddTaskPage(),
    ),
  ];
}
