part of 'user_cubit.dart';

abstract class UserState extends Equatable {

  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  final NormalUser initialUser = NormalUser(
    name: '-',
    email: '-',
    phoneNumber: '-',
    isOnline: false,
    uid: '-',
    status: '-',
    profileUrl:'-' ,
    password: '-',
    gender: '-',
    dob: DateTime.parse("2000-01-01T00:00:00.000Z"),
  );

  get user => initialUser;

}

class UsersListLoaded extends UserState {
  final List<NormalUser> users;

  const UsersListLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UserLoaded extends UserState {
  final NormalUser user;

  const UserLoaded( {required this.user,});


  @override
  List<Object> get props => [user];

  NormalUser copyWithNormalUser({
      String? name,
      String? email,
      String? phoneNumber,
      bool? isOnline,
      String? uid,
      String? status,
      String? profileUrl,
      String? password,
      String? gender,
      DateTime? dob,
  }) {
    return NormalUser(
      name: name ?? user.name,
      email: email ?? user.email,
      phoneNumber: phoneNumber ?? user.phoneNumber,
      isOnline: isOnline ?? user.isOnline,
      uid: uid ?? user.uid,
      status: status ?? user.status,
      profileUrl: profileUrl ?? user.profileUrl,
      password: password ?? user.password,
      gender: gender ?? user.gender,
      dob: dob ?? user.dob,
    );
  }
}

class UserFailure extends UserState {}
