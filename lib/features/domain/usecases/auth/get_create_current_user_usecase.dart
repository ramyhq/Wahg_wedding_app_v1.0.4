
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GetCreateCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCreateCurrentUserUseCase({required this.authRepository});

  Future<void> getCreateCurrentUserUseCase(NormalUser user) {
    return authRepository.getCreateCurrentUser(user);
  }
}
