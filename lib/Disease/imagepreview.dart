// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:first_ui/components/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result.dart';
import 'services/http.dart';
import 'widgets/login_button.dart';

class ImagePreview extends StatefulWidget {
  final String imagePath;

  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigationbar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Preview your image",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.file(File(widget.imagePath),
                    height: 300, fit: BoxFit.cover),
                Spacer(
                  flex: 1,
                ),
                LoginButton(
                  title: "Analyze",
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var result = await sendToPredictor(widget.imagePath);
                    final String plant = result['plant'];
                    final String disease = result['disease'];
                    final String remedy = result['remedy'];
                    print(result);
                    setState(() {
                      isLoading = false;
                    });
                    Get.to(() => ResultPage(
                          imagePath: widget.imagePath,
                          disease: disease,
                          plant: plant,
                          remedy: remedy,
                        ));
                  },
                ),
                isLoading
                    ? Expanded(
                        flex: 2,
                        child: Center(child: CircularProgressIndicator()))
                    : Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
