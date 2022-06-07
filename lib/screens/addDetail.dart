// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_field, prefer_final_fields

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_ui/components/navigationbar.dart';
import 'package:first_ui/screens/home/reminder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_ui/services/firestore_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:first_ui/components/input.dart';
import 'package:first_ui/components/button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  Uint8List? _file;
  bool _isLoading = false;
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create a post"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text("Take a photo"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text("Pick a photo from gallery"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void postData(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FireStoreMethods().uploadPost(
        _cropController.text,
        _varietyController.text,
        _irrigationController.text,
        _stageController.text,
        _pestController.text,
        _file!,
      );
      if (res == "Suceess") {
        setState(() {
          _isLoading = false;
        });
        clearImage();
      } else {
        Get.snackbar("Data", "Your Data Has been Submitted SuccesFully");
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  String? imageUrl;
  CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');
  File? _image;
  Future getImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image as File;
      print('Image Path $_image');
    });
  }

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
  bool _isloading = false;
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
              SizedBox(height: 18),
              GestureDetector(
                child: ReminderBanner(
                  upText: "Pest Attack\n",
                  mainText: "Upload Your Image",
                  tscolor: Colors.white,
                  color: Color(0xFF4A3298),
                ),
                onTap: () async {
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(
                      label: "Submit",
                      onTap: () {
                        postData(context);
                        _cropController.clear();
                        _varietyController.clear();
                        _stageController.clear();
                        _irrigationController.clear();
                        _pestController.clear();
                      })
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  _getFromGallery() async {
    final PickedFile? pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile as File;
    });
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No Image Selected");
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
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
}
