import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/success/success.dart';
import '../datasources/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthenticationSuccess>> login(
    String email,
    String password,
  );
  Future<Either<Failure, AuthenticationSuccess>> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  );
  Future<Either<Failure, Success>> logout();
  User? getCurrentUser();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthenticationSuccess>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await _remoteDataSource.loginWithEmailAndPassword(
        email,
        password,
      );
      return Right(AuthenticationSuccess(result));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Authentication Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticationSuccess>> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String phone,
  ) async {
    try {
      final result = await _remoteDataSource.registerWithEmailAndPassword(
        email,
        password,
        firstName,
        lastName,
        phone,
      );
      return Right(AuthenticationSuccess(result));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Registration Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(AuthenticationSuccess(null));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  User? getCurrentUser() {
    return _remoteDataSource.getCurrentUser();
  }
}
