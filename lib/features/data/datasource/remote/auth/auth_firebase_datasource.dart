 
import 'package:wahg_v1/features/data/models/auth/normal_user_model.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';

abstract class AuthFirebaseRemoteDataSource {
  //Credential Section
  Future<void> signIn(NormalUser user);
  Future<void> skipSignIn();
  Future<void> signUp(NormalUser user);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<void> forgotPassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateUser(NormalUser user);
  Future<void> getCreateCurrentUser(NormalUser user);
  Future<String> getCurrentUserId();
  //FIXME: missing methods
  Future<NormalUserModel> getCurrentUser(String uid);
  Stream<NormalUserModel> getCurrentUserStream(String uid);
  Stream<List<NormalUserModel>> getAllUsers();
}
