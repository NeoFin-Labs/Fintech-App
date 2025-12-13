import 'package:fintech_app/core/services/biometric_auth_service.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_cubit.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:fintech_app/core/network/dio_factory.dart';
import 'package:fintech_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fintech_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
  getIt.registerLazySingleton(() => BiometricAuthService());
  getIt.registerFactory(() => BiometricCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));

  // Initialize GoogleSignIn with serverClientId
  final googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    // Web OAuth client ID from google-services.json
    // Required for serverClientId on Android
    serverClientId:
        '1015164648222-279geqmpaqj56n9irg0791gnk0g5p5ut.apps.googleusercontent.com',
  );

  // Auth Feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      googleSignIn: googleSignIn,
      facebookAuth: FacebookAuth.instance,
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
}
