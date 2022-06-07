// ignore_for_file: prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:first_ui/news/lib/newspage.dart';
import 'package:first_ui/screens/home/home.dart';
import 'package:first_ui/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({Key? key}) : super(key: key);

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  var _selectedTab = _SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      if (_selectedTab == _SelectedTab.home) {
        Get.to(HomeScreen());
      } else if (_selectedTab == _SelectedTab.news) {
        Get.to(NewsPage());
      } else if (_selectedTab == _SelectedTab.profile) {
        print("Tapped");
        Get.to(Profile());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      enableFloatingNavBar: true,
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      backgroundColor: Colors.green,
      dotIndicatorColor: Colors.black,
      unselectedItemColor: Colors.white,
      onTap: _handleIndexChanged,
      items: [
        DotNavigationBarItem(
            icon: Icon(Icons.home), selectedColor: Colors.black),
        DotNavigationBarItem(
            icon: Icon(Icons.newspaper), selectedColor: Colors.black),
        DotNavigationBarItem(
            icon: Icon(Icons.person), selectedColor: Colors.black)
      ],
    );
  }
}

enum _SelectedTab { home, news, profile }
