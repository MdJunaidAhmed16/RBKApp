// ignore_for_file: prefer_const_constructors

import 'package:first_ui/screens/home/categorieslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double getProportionateScreenWidth(double inputWidth) {
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    List<Map<String, dynamic>> categories = [
      {"icon": "assets/mspv.jpg", "text": "MSP Values"},
      {"icon": "assets/plant.png", "text": "Seasonal Report"},
      {"icon": "assets/ferti.png", "text": "Fertilizers"},
      {"icon": "assets/mag.jpg", "text": "Plant Disease"},
      {"icon": "assets/tasker.png", "text": "Todo"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => CategoriesList().cat[index],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 1,
        ),
        itemCount: CategoriesList().cat.length,
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: List.generate(
      //     categories.length,
      //     (index) => CategoryCard(
      //       icon: categories[index]["icon"],
      //       text: categories[index]["text"],
      //       press: () {},
      //     ),
      //   ),
      // ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double getProportionateScreenWidth(double inputWidth) {
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(70),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                icon,
                height: 50,
                width: 30,
              ),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
