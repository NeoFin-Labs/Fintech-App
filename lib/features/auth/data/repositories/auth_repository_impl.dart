import 'package:dartz/dartz.dart';
import 'package:fintech_app/core/logger/app_logger.dart';
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
  Future<Either<Failure, AuthenticationSuccess>> signInWithGoogle();
  Future<Either<Failure, AuthenticationSuccess>> signInWithFacebook();
  Future<Either<Failure, Success>> resetPassword(String email);
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
  Future<Either<Failure, AuthenticationSuccess>> signInWithGoogle() async {
    try {
      AppLogger.logInfo('Repository before signInWithGoogle');
      final result = await _remoteDataSource.signInWithGoogle();
      AppLogger.logInfo('Repository after signInWithGoogle');
      return Right(AuthenticationSuccess(result));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_ABORTED_BY_USER') {
        // You might want to handle this differently, e.g. not showing error
        AppLogger.logInfo('Repository catch signInWithGoogle');
        return Left(ServerFailure('Sign in cancelled'));
      }
      AppLogger.logInfo('Repository catch signInWithGoogle');
      return Left(ServerFailure(e.message ?? 'Google Sign In Failed'));
    } catch (e) {
      AppLogger.logInfo('Repository catch signInWithGoogle');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticationSuccess>> signInWithFacebook() async {
    try {
      final result = await _remoteDataSource.signInWithFacebook();
      return Right(AuthenticationSuccess(result));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? 'Facebook Sign In Failed'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> resetPassword(String email) async {
    try {
      await _remoteDataSource.resetPassword(email);
      return const Right(PasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email address';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        default:
          errorMessage = e.message ?? 'Failed to send password reset email';
      }
      return Left(ServerFailure(errorMessage));
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
