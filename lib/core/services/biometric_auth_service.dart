import 'package:fintech_app/core/logger/app_logger.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if device supports biometric authentication
  Future<bool> canCheckBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  /// Check if device has biometric hardware
  Future<bool> isDeviceSupported() async {
    try {
      return await _localAuth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  /// Get available biometric types on the device
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  /// Check if Face ID is available
  Future<bool> isFaceIdAvailable() async {
    final biometrics = await getAvailableBiometrics();
    return biometrics.contains(BiometricType.face);
  }

  /// Check if Fingerprint is available
  Future<bool> isFingerprintAvailable() async {
    final biometrics = await getAvailableBiometrics();
    AppLogger.logInfo(biometrics.toString());
    return biometrics.contains(BiometricType.fingerprint);
  }

  /// Check if strong biometric authentication is available
  /// Strong biometrics include Face ID, Touch ID, and other hardware-based biometrics
  /// This excludes weak biometrics like some face unlock implementations
  Future<bool> isStrongBiometricAvailable() async {
    try {
      // Check if device supports biometrics
      final canCheck = await canCheckBiometrics();
      final isSupported = await isDeviceSupported();
      AppLogger.logInfo(canCheck.toString());
      AppLogger.logInfo(isSupported.toString());

      if (!canCheck || !isSupported) {
        AppLogger.logInfo("canCheck || !isSupported");
        return false;
      }

      // Get available biometrics
      final biometrics = await getAvailableBiometrics();
      AppLogger.logInfo(biometrics.toString());

      // Strong biometrics are Face ID, Touch ID/Fingerprint, and Iris
      // These are hardware-based and considered strong
      final hasStrongBiometric =
          biometrics.contains(BiometricType.strong) ||
          biometrics.contains(BiometricType.face) ||
          biometrics.contains(BiometricType.fingerprint) ||
          biometrics.contains(BiometricType.iris);

      AppLogger.logInfo(hasStrongBiometric.toString());
      return hasStrongBiometric;
    } on PlatformException {
      return false;
    }
  }

  /// Authenticate using biometrics
  /// Uses strong biometric authentication (hardware-based)
  Future<bool> authenticate({
    String localizedReason = 'Please authenticate to continue',
  }) async {
    try {
      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: localizedReason,
      );
      return didAuthenticate;
    } on PlatformException {
      return false;
    }
  }

  /// Stop authentication
  Future<void> stopAuthentication() async {
    await _localAuth.stopAuthentication();
  }
}
