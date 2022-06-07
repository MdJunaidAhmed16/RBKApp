// ignore_for_file: prefer_const_constructors
import 'package:first_ui/Disease/detection.dart';

import 'package:first_ui/components/croptile.dart';
import 'package:first_ui/constants/colors.dart';
import 'package:first_ui/screens/grid.dart';
import 'package:first_ui/screens/home/task.dart';

import 'package:first_ui/screens/mspval.dart';

class CategoriesList {
  List cat = [
    CropTile(
        height: 109,
        width: 100,
        color: kSecondaryColor.withOpacity(0.1),
        title: "MSP",
        assetPath: "assets/mspv.jpg",
        destination: mspVal(),
        price: ""),
    CropTile(
        height: 109,
        width: 100,
        color: kSecondaryColor.withOpacity(0.1),
        title: "Report",
        assetPath: "assets/plant.png",
        destination: GridScreen(),
        price: ""),
    CropTile(
        height: 109,
        width: 100,
        color: kSecondaryColor.withOpacity(0.1),
        title: "Disease",
        assetPath: "assets/mag.jpg",
        destination: DetectionApp(),
        price: ""),
    CropTile(
        height: 109,
        width: 100,
        color: kSecondaryColor.withOpacity(0.1),
        title: "To-Do",
        assetPath: "assets/tasker.png",
        destination: ToDo(),
        price: ""),
  ];
}
