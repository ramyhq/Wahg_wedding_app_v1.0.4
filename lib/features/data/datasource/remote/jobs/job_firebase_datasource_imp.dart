import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/data/datasource/remote/jobs/job_firebase_datasource.dart';
import 'package:wahg_v1/features/data/models/cafe_and_restaurant_model.dart';
import 'package:wahg_v1/features/data/models/category_model.dart';
import 'package:wahg_v1/features/data/models/dress_model.dart';
import 'package:wahg_v1/features/data/models/hair_model.dart';
import 'package:wahg_v1/features/data/models/jobs/job_model.dart';
import 'package:wahg_v1/features/data/models/makeup_artist_model.dart';
import 'package:wahg_v1/features/data/models/photographer_model.dart';
import 'package:wahg_v1/features/data/models/suit_model.dart';
import 'package:wahg_v1/features/data/models/travel_model.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';


class JobsFirebaseRemoteDataSourceImp extends JobsFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  JobsFirebaseRemoteDataSourceImp({
    required this.firestore,
    required this.auth,
    required this.googleSignIn,
  });

  Future<String> getCurrentUserId() async => auth.currentUser!.uid;
  

  ///////// Jobs /////////

  // Collection >> "j1_jobs_col"
  @override
  Future<List<JobModel>> getJobsList() async {
    List<JobModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getJobsList() FAILED $e');
    // }

    try {
      col = await firestore.collection("j1_jobs_col").get();
      col.docs.map((doc) {
        JobModel job = JobModel.fromSnapshot(doc);
        list.add(job);
      }).toList();

      //print('📍 1.0: in getJobsList list : ${list}');
      //print('📍 1.3: in getJobsList list : ${list[0].jobTitle}');
      //print('📍 1.3: in getJobsList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getJobsList() :$e');
    }
  }

  @override
  Future<void> updateAllJobsList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var job in data) {
        //String jobId = Uuid().v1();
        // job['jobId'] = jobId;
        await firestore
            .collection('j1_jobs_col')
            .doc(job['jobId'])
            .set(job);
        print('2 :${job['jobTitle']}');
        print('id :${job['jobId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllJobsList() :$e');
    }
  }

}

