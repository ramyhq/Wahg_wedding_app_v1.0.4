
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GoogleAuthUseCase {
  final AuthRepository authRepository;

  GoogleAuthUseCase({required this.authRepository});

  Future<void> googleAuth() {
    return authRepository.googleAuth();
  }
}
