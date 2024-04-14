import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_all_users_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_update_user_usercase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUserUseCase getAllUserUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final GetUpdateUserUseCase getUpdateUserUseCase;
  UserCubit(
      {required this.getAllUserUseCase,
      required this.getUpdateUserUseCase,
      required this.getCurrentUserUseCase})
      : super(UserInitial());

  Future<void> getUsers() async {
    try {
      getAllUserUseCase.call().listen((listUsers) {
        emit(UsersListLoaded(users: listUsers));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> getCurrentUser(String uid) async {
    try {
      var user = await getCurrentUserUseCase.getCurrentUser(uid);
      emit(UserLoaded(user: user));
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (e) {

      emit(UserFailure());
    }
  }

  Future<void> updateUser({required NormalUser user}) async {
    try {
      getUpdateUserUseCase.getUpdateUserUseCase(user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
