import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String cropName;
  final String cropVariety;
  final String cropStage;
  final String irrigationResource;
  final String isPest;
  final DateTime datePublished;
  final String postUrl;

  const Post({
    required this.cropName,
    required this.cropVariety,
    required this.cropStage,
    required this.irrigationResource,
    required this.datePublished,
    required this.postUrl,
    required this.isPest,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        cropName: snapshot["description"],
        cropVariety: snapshot["likes"],
        cropStage: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        irrigationResource: snapshot["username"],
        isPest: snapshot['isPest'],
        postUrl: snapshot['postUrl']);
  }

  Map<String, dynamic> toJson() => {
        "cropName": cropName,
        "cropVariety": cropVariety,
        "cropStage": cropStage,
        "irrigationResource": irrigationResource,
        "isPest": isPest,
        "datePublished": datePublished,
        'postUrl': postUrl,
      };
}
