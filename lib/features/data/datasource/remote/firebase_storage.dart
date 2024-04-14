import 'dart:async';
import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRemoteStorageImp {
  final FirebaseStorage storage = FirebaseStorage.instance;

  /// This function to get images links as list from Firebase Storage for each product

  getURLs() async {
    var storageRef = storage.ref().child("s3_makeup_artist_col");

    int id = 1;
    int ido = 1;
    List<Map<String, dynamic>> finalURL = [];
    List urls = [];
    var images = await storageRef.listAll();
    print("33da0 images is ${images.items.length}");

    for (var element in images.items) {
      Map<String, dynamic> data = {
        "dressId": "1",
        "dressImages": [],
      };

      var url = await storage
          .ref()
          .child(element.fullPath.toString())
          .getDownloadURL();

      // if (element.fullPath.toString().contains("dress${ido}_${id}")) {}

      urls.add('"${url.toString()}"');
      data['dressId'] = ido.toString();

      if (data["dressId"] == ido.toString() && id == 4) {
        data['dressImages'] = urls;
        print("33da0 result is ${data}");
        finalURL.add(data);
        urls = [];
      }

      if (id == 4) {
        ido++;
        id = 0;
      }
      id++;
    }
    // Future.delayed(Duration(seconds: 4), () {
    //   log("3333333 result is ${finalURL}");
    // });
  }
}
