import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wahg_v1/features/domain/entities/auth/normal_user_entity.dart';
import 'package:wahg_v1/features/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_create_current_user_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/google_auth_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/sign__up_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/sign_in_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/skip_sign_in_usecase.dart';
part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SkipSignInUseCase skipSignInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;
  CredentialCubit({
    required this.signInUseCase,
    required this.skipSignInUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitial());

  Future<void> submitSignIn({required NormalUser user}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.signIn(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> skipSignIn() async {
    emit(CredentialLoading());
    try {
      await skipSignInUseCase.skipSignIn();
      emit(CredentialSuccess(isAnonymous: true));
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required NormalUser user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.getCreateCurrentUserUseCase(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleAuth() async {
    emit(CredentialLoading());
    try {
      googleAuthUseCase.googleAuth();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({required NormalUser user}) async {
    try {
      forgotPasswordUseCase.forgotPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
