
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  Future<void> forgotPassword(String email) {
    return authRepository.forgotPassword(email);
  }
}
