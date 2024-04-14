
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<void> signUp(NormalUser user) {
    return authRepository.signUp(user);
  }
}
