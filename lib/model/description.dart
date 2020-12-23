import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Description {
  String title;
  String location;
  String image;
  Timestamp createdAt;

  Description.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    location = data['location'];
    image = data['image'];
    createdAt = data['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'image': image,
      'createdAt': createdAt,
    };
  }
}
