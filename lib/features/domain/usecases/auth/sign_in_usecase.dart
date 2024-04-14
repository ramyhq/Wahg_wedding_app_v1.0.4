
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<void> signIn(NormalUser user) async {
    return await authRepository.signIn(user);
  }
}
