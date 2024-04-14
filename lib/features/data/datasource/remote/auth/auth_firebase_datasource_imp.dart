import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wahg_v1/commons/error/failure.dart';

import 'package:wahg_v1/features/data/datasource/remote/auth/auth_firebase_datasource.dart';
import 'package:wahg_v1/features/data/models/auth/normal_user_model.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';

class AuthFirebaseRemoteDataSourceImp implements AuthFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthFirebaseRemoteDataSourceImp(
      {required this.firestore,
      required this.auth,
      required this.googleSignIn});

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(NormalUser user) async {
    final userCollection = firestore.collection("users");

    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = NormalUserModel(
        gender: user.gender,
        isOnline: user.isOnline,
        name: user.name,
        phoneNumber: user.phoneNumber,
        profileUrl: user.profileUrl,
        status: user.status,
        email: user.email,
        password: user.password,
        dob: user.dob,
        uid: uid,
      ).toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  @override
  Future<void> getUpdateUser(NormalUser user) async {
    Map<String, dynamic> userInformation = {};
    final userCollection = firestore.collection("users");

    if (user.profileUrl != null && user.profileUrl != "") {
      userInformation['profileUrl'] = user.profileUrl;
    }

    if (user.name != null && user.name != "") {
      userInformation['name'] = user.name;
    }
    if (user.email != null && user.email != "") {
      userInformation['email'] = user.email;
    }
    if (user.phoneNumber != null && user.phoneNumber != "") {
      userInformation['phoneNumber'] = user.phoneNumber;
    }

    if (user.status != null && user.status != "") {
      userInformation['status'] = user.status;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<void> googleAuth() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account!.authentication;

    final AuthCredential authCredentail = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final userInformation =
        (await auth.signInWithCredential(authCredentail)).user;

    getCreateCurrentUser(NormalUserModel(
      uid: userInformation!.uid,
      name: userInformation!.displayName,
      email: userInformation.email,
      gender: "",
      dob: DateTime.parse("2000-01-01T00:00:00.000Z"),
      phoneNumber: userInformation.phoneNumber,
      profileUrl: userInformation.photoURL,
      status: "",
      isOnline: false,
    ));
  }

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(NormalUser user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> skipSignIn() async {
    await auth.signInAnonymously();
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> signUp(NormalUser user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }
  @override
  Future<NormalUserModel> getCurrentUser(String uid) async {
    NormalUserModel user;
    final userCollection = firestore.collection("users");
    final uid = await getCurrentUserId();
    try {
      var userDoc = await userCollection.doc(uid).get();
      user = NormalUserModel.fromSnapshot(userDoc);
      print('AuthFirebaseRemoteDataSourceImp > in getCurrentUser() :${user.email}');

      return user;

    } catch (e) {
      print('AuthFirebaseRemoteDataSourceImp > in getCurrentUser() :$e');
      throw ServerFailure(
          '[ServerFailure ❌] > AuthFirebaseRemoteDataSourceImp > in getCategories() ');
    }

  }
  @override
  Stream<NormalUserModel> getCurrentUserStream(String uid) {
    final userCollection = firestore.collection("users");
    return userCollection
        .doc(uid)
        .snapshots()
        .map((snap) => NormalUserModel.fromSnapshot(snap));
  }


  @override
  Stream<List<NormalUserModel>> getAllUsers() {
    final userCollection = firestore.collection("users");

    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((e) => NormalUserModel.fromSnapshot(e))
        .toList());
  }

}
