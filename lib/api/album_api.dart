import 'dart:io';

import 'package:album/model/description.dart';
import 'package:album/notifier/desc_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

getDesc(DescNotifier descNotifier) async {
  // ignore: deprecated_member_use
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Descriptions')
      .orderBy("createdAt", descending: true)
      // ignore: deprecated_member_use
      .getDocuments();

  List<Description> _desclist = [];

  // ignore: deprecated_member_use
  snapshot.documents.forEach((document) {
    Description description = Description.fromMap(document.data());
    _desclist.add(description);
  });

  descNotifier.desclist = _desclist;
}
