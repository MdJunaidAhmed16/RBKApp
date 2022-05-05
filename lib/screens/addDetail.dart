// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_field

import 'dart:io';

import 'package:first_ui/Disease/camera.dart';
import 'package:first_ui/components/navigationbar.dart';
import 'package:first_ui/constants/colors.dart';
import 'package:first_ui/constants/constants.dart';
import 'package:first_ui/screens/home/reminder.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:first_ui/components/input.dart';
import 'package:first_ui/constants/theme.dart';
import 'package:first_ui/components/button.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _cropController = TextEditingController();
  final TextEditingController _varietyController = TextEditingController();
  final TextEditingController _stageController = TextEditingController();
  final TextEditingController _irrigationController = TextEditingController();
  final TextEditingController _pestController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  late File imageFile;
  String _selectedRepeat = "None";
  List<String> cropList = ["Rice", "Maize", "Banana", "SugarCane"];
  int _selectedColor = 0;
  int pressed = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Crop Details",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              MyInputField(
                  hint: "Enter the Crop Name Here",
                  title: "Crop",
                  controller: _cropController),
              MyInputField(
                hint: "Enter the Crop Variety",
                title: "Crop variety",
                controller: _varietyController,
              ),
              MyInputField(
                hint: "Ente Stage of the Crop",
                title: "Stage",
                controller: _stageController,
              ),
              MyInputField(
                hint: "Enter the Irrigation Resource.",
                title: "Irrigation",
                controller: _irrigationController,
              ),
              MyInputField(
                hint: DateFormat.yMd().format(DateTime.now()),
                title: "Date",
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  onPressed: () {},
                ),
              ),
              MyInputField(
                hint: "Enter pest attack*",
                title: "Pests",
                controller: _pestController,
              ),

              // MyInputField(
              //   hint: "Enter any Pest attack",
              //   title: "Pest",
              //   widget: DropdownButton(
              //     icon: Icon(
              //       Icons.keyboard_arrow_down,
              //     ),
              //     iconSize: 32,
              //     elevation: 4,
              //     style: subtitleStyle,
              //     underline: Container(height: 0),
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         _selectedRepeat = newValue!;
              //       });
              //     },
              //     items: cropList.map<DropdownMenuItem<String>>((String? value) {
              //       return DropdownMenuItem<String>(
              //         value: value.toString(),
              //         child: Text(value!),
              //       );
              //     }).toList(),
              //   ),
              // ),
              // TextButton(
              //     onPressed: () => setState(() {
              //           print(pressed);
              //           pressed = 1;
              //         }),
              //     child: Text("Add Another Fertilizerr")),
              // pressed == 1
              //     ? MyInputField(
              //         hint: "$_selectedRepeat",
              //         title: "Repeat",
              //         widget: DropdownButton(
              //           icon: Icon(
              //             Icons.keyboard_arrow_down,
              //           ),
              //           iconSize: 32,
              //           elevation: 4,
              //           style: subtitleStyle,
              //           underline: Container(height: 0),
              //           onChanged: (String? newValue) {
              //             setState(() {
              //               _selectedRepeat = newValue!;
              //             });
              //           },
              //           items: repeatList
              //               .map<DropdownMenuItem<String>>((String? value) {
              //             return DropdownMenuItem<String>(
              //               value: value.toString(),
              //               child: Text(value!),
              //             );
              //           }).toList(),
              //         ),
              //       )
              //     : Container(),
              SizedBox(height: 18),
              GestureDetector(
                child: ReminderBanner(
                  upText: "Pest Attack\n",
                  mainText: "Upload Your Image",
                  tscolor: Colors.white,
                  color: Color(0xFF4A3298),
                ),
                onTap: () => Get.to(() => CameraPage()),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(label: "Submit", onTap: () => _validateDate())
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  _validateDate() {
    if (_cropController.text.isNotEmpty && _cropController.text.isNotEmpty) {
      // _addTaskToDb();
      Get.back();
    } else if (_cropController.text.isEmpty ||
        _varietyController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning_amber_rounded),
      );
    }
  }

  _getFromGallery() async {
    final PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile as File;
    });
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(""),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2220));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("Its null");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
