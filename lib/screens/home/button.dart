import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:first_ui/constants/colors.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.path,
    this.numOfitem = 0,
    required this.press,
    required this.tpe,
  }) : super(key: key);

  final String path;
  final bool tpe;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double getProportionateScreenWidth(double inputWidth) {
      // 812 is the layout height that designer use
      return (inputWidth / 812.0) * screenWidth;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(86),
            width: getProportionateScreenWidth(86),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child:
                tpe ? SvgPicture.asset(path) : Image(image: AssetImage(path)),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(36),
                width: getProportionateScreenWidth(36),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
