import 'package:fintech_app/core/logger/app_logger.dart';
import 'package:fintech_app/core/success/success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await _authRepository.login(email, password);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(AuthLoading());
    final result = await _authRepository.register(
      email,
      password,
      firstName,
      lastName,
      phone,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }

  Future<void> signInWithGoogle() async {
    AppLogger.logInfo('Cubit before AuthLoading signInWithGoogle');
    emit(AuthLoading());
    AppLogger.logInfo('Cubit after AuthLoading signInWithGoogle');
    final result = await _authRepository.signInWithGoogle();
    AppLogger.logInfo('Cubit after signInWithGoogle');
    result.fold(
      (failure) {
        AppLogger.logInfo('Cubit after AuthFailure signInWithGoogle');
        emit(AuthFailure(failure.message));
      },
      (success) {
        AppLogger.logInfo('Cubit after AuthSuccess signInWithGoogle');
        emit(AuthSuccess(success));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    final result = await _authRepository.signInWithFacebook();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await _authRepository.logout();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess(success as AuthenticationSuccess)),
    );
  }
}
