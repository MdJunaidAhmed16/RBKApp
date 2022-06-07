import 'package:flutter/material.dart';

class InputSection extends SliverFixedExtentList {
  InputSection(Size size, {Key? key})
      : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, index) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(
                      (0.061 * size.height * 0.26),
                      (0.071 * size.height * 0.26),
                      (0.076 * size.height * 0.26),
                      (0.061 * size.height * 0.26)),
                  child: Container(
                    height: size.height * 0.26,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius:
                          BorderRadius.circular((0.061 * size.height * 0.26)),
                    ),
                    child: Image.asset("assets/disease.png"),
                  ));
            },
            childCount: 1,
          ),
          itemExtent: size.height * 0.26,
        );
}
