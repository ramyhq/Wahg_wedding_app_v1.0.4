
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<void> signOutUseCase() {
    return authRepository.signOut();
  }
}
