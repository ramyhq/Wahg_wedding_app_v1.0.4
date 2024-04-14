
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';

class NormalUserModel extends NormalUser {
  const NormalUserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final bool? isOnline,
    required final String uid,
    final String? status,
    final String? profileUrl,
    final String? password,
    final String? gender,
    final DateTime? dob,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          status: status,
          profileUrl: profileUrl,
          password: password,
          gender: gender,
          dob: dob,
        );


  factory NormalUserModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return NormalUserModel(
        name: doc.get('name'),
        email: doc.get('email'),
        phoneNumber: doc.get('phoneNumber'),
        isOnline: doc.get('isOnline'),
        uid: doc.get('uid'),
        status: doc.get('status'),
        profileUrl: doc.get('profileUrl'),
        password: doc.get('password'),
        gender: doc.get('gender'),
        dob:  doc.get('dob').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
      );
    } catch (e) {
      print('❌ 555 Error in NormalUserModel.fromSnapshot : $e');
      throw '❌ 555 Error in NormalUserModel.fromSnapshot : $e';
    }
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'uid': uid,
      'status': status,
      'profileUrl': profileUrl,
      'gender': gender,
      'dob': dob,
    };
  }
}
