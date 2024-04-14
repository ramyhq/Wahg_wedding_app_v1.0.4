
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GetCurrentUserIdUseCase {
  final AuthRepository authRepository;

  GetCurrentUserIdUseCase({required this.authRepository});

  Future<String> call() {
    //getCurrentUserId
    return authRepository.getCurrentUserId();
  }
}
