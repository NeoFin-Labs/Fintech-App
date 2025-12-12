import 'package:fintech_app/core/services/biometric_auth_service.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:fintech_app/core/network/dio_factory.dart';
import 'package:fintech_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fintech_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
  getIt.registerLazySingleton(() => BiometricAuthService());
  getIt.registerFactory(() => BiometricCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));

  // Auth Feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
}
