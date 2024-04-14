
import 'package:wahg_v1/features/data/models/auth/normal_user_model.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';

abstract class AuthRepository {
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
  Future<NormalUser> getCurrentUser(String uid);
  Stream<NormalUser> getCurrentUserStream(String uid);
  Stream<List<NormalUser>> getAllUsers();
}
