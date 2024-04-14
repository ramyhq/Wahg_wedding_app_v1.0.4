
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';

class GetAllUserUseCase {
  final AuthRepository authRepository;

  GetAllUserUseCase({required this.authRepository});

  Stream<List<NormalUser>> call() {
    return authRepository.getAllUsers();
  }
}
