import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/core/services/biometric_auth_service.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/biometric_availability_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  final BiometricAuthService _biometricAuthService;

  BiometricCubit(this._biometricAuthService)
    : super(const BiometricInitial());

  Future<void> checkBiometricAvailability() async {
    emit(const BiometricLoading());

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

  Future<void> authenticateWithBiometric() async {
    try {
      final didAuthenticate = await _biometricAuthService.authenticate();
      if (didAuthenticate) {
        emit(const BiometricAuthenticationSuccessState());
      } else {
        emit(const BiometricAuthenticationErrorState());
      }
    } catch (e) {
      emit(
        BiometricAuthenticationErrorState(
          message: 'Failed to authenticate with biometric: $e',
        ),
      );
    }
  }
}
