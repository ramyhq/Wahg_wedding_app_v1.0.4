part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {
  final String uid;
  bool isAnonymous;

   AuthenticatedState({required this.uid,this.isAnonymous = false});
  @override
  List<Object> get props => [uid];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}
