import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/challenge/features/video/models/photo_model.dart';

class PhotosRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadPhotoFile(
    File photo,
    String uid,
  ) {
    try {
      final fileRef = _storage.ref().child(
          "/photos/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}");
      return fileRef.putFile(photo);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> savePhoto(PhotoModel data) async {
    await _db.collection("photos").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPhotos() {
    return _db
        .collection("photos")
        // .orderBy(
        //   "createdAt",
        //   descending: true,
        // ) // 색인 안돼있어서 보류
        .get();
  }
}

final photoRepo = Provider(
  (ref) => PhotosRepository(),
);
