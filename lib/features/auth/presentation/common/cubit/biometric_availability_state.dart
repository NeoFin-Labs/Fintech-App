/// Base sealed class for biometric availability states
sealed class BiometricState {
  const BiometricState();
}

/// Initial state - checking biometric availability
class BiometricInitial extends BiometricState {
  const BiometricInitial();
}

/// Loading state - currently checking biometric availability
class BiometricLoading extends BiometricState {
  const BiometricLoading();
}

/// Success state - biometric availability check completed
class BiometricAvailabilitySuccess extends BiometricState {
  final bool isDeviceSupported;
  final bool canCheckBiometrics;
  final bool isFaceIdAvailable;
  final bool isFingerprintAvailable;
  final bool isStrongBiometricAvailable;

  const BiometricAvailabilitySuccess({
    required this.isDeviceSupported,
    required this.canCheckBiometrics,
    required this.isFaceIdAvailable,
    required this.isFingerprintAvailable,
    required this.isStrongBiometricAvailable,
  });

  /// Returns true if any biometric is available
  bool get hasAnyBiometric => isFaceIdAvailable || isFingerprintAvailable;

  /// Returns true only if strong biometric authentication is available
  /// This is the recommended check for showing biometric login options
  bool get hasStrongBiometric => isStrongBiometricAvailable;
}

/// Error state - biometric availability check failed
class BiometricAvailabilityError extends BiometricState {
  final String? message;

  const BiometricAvailabilityError({this.message});
}

class BiometricAuthenticationSuccessState extends BiometricState {
  const BiometricAuthenticationSuccessState();
}

class BiometricAuthenticationErrorState extends BiometricState {
  final String? message;

  const BiometricAuthenticationErrorState({this.message});
}
