import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_ui/services/storage_methods.dart';
import 'package:flutter/material.dart';
import 'package:first_ui/components/postdata.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload a post
  Future<String> uploadPost(
    String cropName,
    String cropVariety,
    String irrigationResource,
    String cropStage,
    String isPest,
    Uint8List file,
  ) async {
    String res = "Error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('reports', file, true);

      Post post = Post(
        cropStage: cropStage,
        isPest: isPest,
        cropName: cropName,
        cropVariety: cropVariety,
        irrigationResource: irrigationResource,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
      );
      _firestore.collection('reports').add(post.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
