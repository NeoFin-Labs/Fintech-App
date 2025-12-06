import 'package:fintech_app/core/services/biometric_auth_service.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:fintech_app/core/network/dio_factory.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
  getIt.registerLazySingleton(() => BiometricAuthService());
  getIt.registerFactory(() => BiometricAvailabilityCubit(getIt()));
}
