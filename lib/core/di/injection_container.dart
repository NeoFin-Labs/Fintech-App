import 'package:get_it/get_it.dart';
import 'package:fintech_app/core/network/dio_factory.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
}
