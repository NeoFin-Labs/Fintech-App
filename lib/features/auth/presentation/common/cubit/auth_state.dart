part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthenticationSuccess success;
  AuthSuccess(this.success);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
