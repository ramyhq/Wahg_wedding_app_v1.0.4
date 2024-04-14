
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class IsSignInUseCase {
  final AuthRepository authRepository;

  IsSignInUseCase({required this.authRepository});

  Future<bool> call() {
    //isSignIn
    return authRepository.isSignIn();
  }
}
