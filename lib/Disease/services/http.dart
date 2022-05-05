import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> sendToPredictor(imagePath) async {
  final imageBytes = File(imagePath).readAsBytesSync();
  String imageBase64 = base64Encode(imageBytes);

  var dio = Dio();

  final response = await dio
      .post("https://plant-disease-detector-pytorch.herokuapp.com/", data: {
    'image': imageBase64,
  });

  // final String plant = response.data['plant'];
  // final String disease = response.data['disease'];

  // final result = {'plant': plant, 'disease': disease};

  return response.data;
}

sendAlerts({plant, disease, username}) async {
  var dio = Dio();

  final response = await dio.post(
      "https://plant-disease-detector-pytorch.herokuapp.com/notification",
      data: {
        'plant': plant,
        'disease': disease,
      });

  // final String plant = response.data['plant'];
  // final String disease = response.data['disease'];

  // final result = {'plant': plant, 'disease': disease};

  return response.data;
}
