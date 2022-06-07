import 'package:flutter/material.dart';

import 'package:first_ui/constants/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({
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
      width: screenWidth * 0.77,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(18)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search Crop",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
