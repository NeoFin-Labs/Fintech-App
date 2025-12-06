/// Base sealed class for biometric availability states
sealed class BiometricAvailabilityState {
  const BiometricAvailabilityState();
}

/// Initial state - checking biometric availability
class BiometricAvailabilityInitial extends BiometricAvailabilityState {
  const BiometricAvailabilityInitial();
}

/// Loading state - currently checking biometric availability
class BiometricAvailabilityLoading extends BiometricAvailabilityState {
  const BiometricAvailabilityLoading();
}

/// Success state - biometric availability check completed
class BiometricAvailabilitySuccess extends BiometricAvailabilityState {
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
class BiometricAvailabilityError extends BiometricAvailabilityState {
  final String? message;

  const BiometricAvailabilityError({this.message});
}
