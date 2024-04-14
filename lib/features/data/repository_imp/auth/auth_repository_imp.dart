import 'package:wahg_v1/features/data/datasource/remote/auth/auth_firebase_datasource.dart';
import 'package:wahg_v1/features/data/models/auth/normal_user_model.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthFirebaseRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp({required this.authRemoteDataSource});

  @override
  Future<void> forgotPassword(String email) async =>
      authRemoteDataSource.forgotPassword(email);
  @override
  Future<void> getCreateCurrentUser(NormalUser user) =>
      authRemoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      authRemoteDataSource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(NormalUser user) async =>
      authRemoteDataSource.getUpdateUser(user);

  @override
  Future<void> googleAuth() async => authRemoteDataSource.googleAuth();

  @override
  Future<bool> isSignIn() async => authRemoteDataSource.isSignIn();

  @override
  Future<void> signIn(NormalUser user) async =>
      authRemoteDataSource.signIn(user);
  @override
  Future<void> skipSignIn() async => authRemoteDataSource.skipSignIn();
  @override
  Future<void> signOut() async => authRemoteDataSource.signOut();

  @override
  Future<void> signUp(NormalUser user) async =>
      authRemoteDataSource.signUp(user);

  @override
  Future<NormalUser> getCurrentUser(String uid) async {
    final user = authRemoteDataSource.getCurrentUser(uid);
  return user;
  }
  @override
  Stream<NormalUser> getCurrentUserStream(String uid) =>
      authRemoteDataSource.getCurrentUserStream(uid);
  @override
  Stream<List<NormalUser>> getAllUsers() => authRemoteDataSource.getAllUsers();



}
