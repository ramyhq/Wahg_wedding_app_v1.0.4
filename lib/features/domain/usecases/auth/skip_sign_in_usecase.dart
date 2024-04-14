
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class SkipSignInUseCase {
  final AuthRepository authRepository;

  SkipSignInUseCase({required this.authRepository});

  Future<void> skipSignIn( ) async {
    return await authRepository.skipSignIn();
  }
}
