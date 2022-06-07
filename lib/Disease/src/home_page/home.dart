import 'package:first_ui/Disease/constants/constants.dart';
import 'package:first_ui/Disease/services/classify.dart';
import 'package:first_ui/Disease/services/disease_provider.dart';
import 'package:first_ui/Disease/src/home_page/components/inputsliver.dart';
import 'package:first_ui/Disease/src/home_page/components/titlesection.dart';
import 'package:first_ui/Disease/src/home_page/models/disease_model.dart';
import 'package:first_ui/Disease/src/suggestions_page/suggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    // Data
    Size size = MediaQuery.of(context).size;
    final Classifier classifier = Classifier();
    late Disease _disease;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "Crop Disease Detection",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SpeedDial(
          buttonSize: const Size(80.0, 80.9),
          backgroundColor: Colors.black,
          child: FaIcon(
            FontAwesomeIcons.camera,
            size: 25,
            color: Colors.white,
          ),
          spacing: 10,
          children: [
            SpeedDialChild(
              child: const FaIcon(
                FontAwesomeIcons.file,
                size: 20,
                color: kWhite,
              ),
              label: "Choose image",
              backgroundColor: Colors.red,
              onTap: () async {
                late double _confidence;
                await classifier.getDisease(ImageSource.gallery).then((value) {
                  _disease = Disease(
                      name: value![0]["label"],
                      imagePath: classifier.imageFile.path);

                  _confidence = value[0]['confidence'];
                });
                // Check confidence
                if (_confidence > 0.8) {
                  // Set disease for Disease Service
                  _diseaseService.setDiseaseValue(_disease);

                  // Save disease

                  Navigator.restorablePushNamed(
                    context,
                    Suggestions.routeName,
                  );
                } else {
                  // Display unsure message

                }
              },
            ),
            SpeedDialChild(
              child: const FaIcon(
                FontAwesomeIcons.camera,
                color: kWhite,
              ),
              label: "Take photo",
              backgroundColor: kMain,
              onTap: () async {
                late double _confidence;

                await classifier.getDisease(ImageSource.camera).then((value) {
                  _disease = Disease(
                      name: value![0]["label"],
                      imagePath: classifier.imageFile.path);

                  _confidence = value[0]['confidence'];
                });

                // Check confidence
                if (_confidence > 0.8) {
                  // Set disease for Disease Service
                  _diseaseService.setDiseaseValue(_disease);

                  // Save disease

                  Navigator.restorablePushNamed(
                    context,
                    Suggestions.routeName,
                  );
                } else {
                  // Display unsure message

                }
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
          ),
          child: CustomScrollView(
            slivers: [
              TitleSection('Upload crop leaf', size.height * 0.066),
              InputSection(size),
            ],
          ),
        ),
      ),
    );
  }
}
