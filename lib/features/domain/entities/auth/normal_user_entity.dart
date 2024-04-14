import 'package:equatable/equatable.dart';

class NormalUser extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final bool? isOnline;
  final String uid;
  final String? status;
  final String? profileUrl;
  final String? password;
  final String? gender;
  final DateTime? dob;

  const NormalUser({
    required this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.isOnline,
    this.status,
    this.profileUrl,
    this.password,
    this.dob,
    this.gender,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        profileUrl,
        password,
        dob,
        gender
      ];
}
