import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCurrentUserUseCase({required this.authRepository});

  Future<NormalUser> getCurrentUser(String uid) {
    try {
      print('00p01');
      return authRepository.getCurrentUser(uid);
    } catch (e) {
      print('00p02 $e');
       return authRepository.getCurrentUser(uid);

    }
  }
}
