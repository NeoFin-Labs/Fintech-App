import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/core/services/biometric_auth_service.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_state.dart';

class BiometricAvailabilityCubit extends Cubit<BiometricAvailabilityState> {
  final BiometricAuthService _biometricAuthService;

  BiometricAvailabilityCubit(this._biometricAuthService)
    : super(const BiometricAvailabilityInitial());

  Future<void> checkBiometricAvailability() async {
    emit(const BiometricAvailabilityLoading());

    try {
      final isDeviceSupported = await _biometricAuthService.isDeviceSupported();
      final canCheckBiometrics = await _biometricAuthService
          .canCheckBiometrics();
      final isFaceIdAvailable = await _biometricAuthService.isFaceIdAvailable();
      final isFingerprintAvailable = await _biometricAuthService
          .isFingerprintAvailable();
      final isStrongBiometricAvailable = await _biometricAuthService
          .isStrongBiometricAvailable();

      emit(
        BiometricAvailabilitySuccess(
          isDeviceSupported: isDeviceSupported,
          canCheckBiometrics: canCheckBiometrics,
          isFaceIdAvailable: isFaceIdAvailable,
          isFingerprintAvailable: isFingerprintAvailable,
          isStrongBiometricAvailable: isStrongBiometricAvailable,
        ),
      );
    } catch (e) {
      emit(
        BiometricAvailabilityError(
          message: 'Failed to check biometric availability: $e',
        ),
      );
    }
  }
}
