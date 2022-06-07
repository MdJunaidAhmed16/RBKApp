// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_ui/components/categories.dart';
import 'package:first_ui/components/croptile.dart';
import 'package:first_ui/components/navigationbar.dart';
import 'package:first_ui/constants/cropslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select a crop",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
          color: Colors.grey,
          tooltip: 'Menu',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => TopProducts().topProductList[index],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: TopProducts().topProductList.length,
        ),
      ),
      bottomNavigationBar: Navigationbar(),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Search',
        ),
      ];
}
