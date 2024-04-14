
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GetUpdateUserUseCase {
  final AuthRepository authRepository;

  GetUpdateUserUseCase({required this.authRepository});

  Future<void> getUpdateUserUseCase(NormalUser user) {
    return authRepository.getUpdateUser(user);
  }
}
