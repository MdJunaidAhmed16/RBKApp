// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:first_ui/components/navigationbar.dart';
import 'package:first_ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/http.dart';
import 'widgets/login_button.dart';

class ResultPage extends StatefulWidget {
  final String disease, plant, remedy;
  final String imagePath;

  const ResultPage(
      {Key? key,
      required this.imagePath,
      required this.disease,
      required this.plant,
      required this.remedy})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ))),
        bottomNavigationBar: Navigationbar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Crop Analysis",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4A3298),
                ),
                child: Text("Plant Name: " + widget.plant,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 20,
              ),
              Image.file(File(widget.imagePath),
                  height: 300, fit: BoxFit.cover),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 53,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4A3298),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.disease == "healthy"
                        ? Text(
                            "Your Plant is Healthy!!",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : Text("Disease detected: " + widget.disease,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                    // widget.disease == "healthy"
                    //     ? Container()
                    //     : Text("Possible remedy: ",
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.bold)),
                    // SizedBox(height: 2),
                    // widget.disease == "healthy"
                    //     ? Container()
                    //     : Text(widget.remedy,
                    //         style: TextStyle(
                    //             fontSize: 14, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              // LoginButton(
              //     title: "Generate A report",
              //     onTap: () async {
              //       await sendAlerts(
              //           plant: widget.plant, disease: widget.disease);
              //       Get.snackbar(
              //         "Success!",
              //         "The report has been generated.",
              //         backgroundColor: Colors.white,
              //         duration: Duration(seconds: 8),
              //       );
              //     }),
              SizedBox(
                height: 10,
              ),
              // LoginButton(
              //     title: "Make Report",
              //     onTap: () async {
              //       setState(() {
              //         isLoading = true;
              //       });

              //       setState(() {
              //         isLoading = false;
              //       });

              // if (result) {
              //   Get.snackbar(
              //     "Success!",
              //     "The Crop Analysis Report has been generated and saved to Downloads folder",
              //     backgroundColor: Colors.white,
              //     duration: Duration(seconds: 16),
              //   );
              // }
              //}),
              isLoading
                  ? Expanded(
                      flex: 1,
                      child: Center(child: CircularProgressIndicator()))
                  : Spacer(
                      flex: 1,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
