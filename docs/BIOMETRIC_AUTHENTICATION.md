# Biometric Authentication Implementation Guide

## Overview
This document explains the complete biometric authentication implementation in the Fintech app, including availability checking and actual authentication.

## Architecture

### 1. **BiometricAuthService** (`lib/core/services/biometric_auth_service.dart`)
The core service that wraps the `local_auth` package and provides methods for:
- Checking device biometric support
- Getting available biometric types (Face ID, Fingerprint)
- Performing biometric authentication
- Stopping authentication

**Key Methods:**
```dart
Future<bool> canCheckBiometrics()           // Check if device supports biometrics
Future<bool> isDeviceSupported()            // Check if device has biometric hardware
Future<List<BiometricType>> getAvailableBiometrics()  // Get all available biometric types
Future<bool> isFaceIdAvailable()            // Check if Face ID is available
Future<bool> isFingerprintAvailable()       // Check if Fingerprint is available
Future<bool> authenticate({String localizedReason})   // Perform authentication
```

### 2. **BiometricAvailabilityCubit** (`lib/features/auth/presentation/common/cubit/`)
State management for biometric availability using BLoC pattern.

**State Properties:**
- `isDeviceSupported`: Whether the device has biometric hardware
- `canCheckBiometrics`: Whether biometric checks are possible
- `isFaceIdAvailable`: Whether Face ID is available
- `isFingerprintAvailable`: Whether Fingerprint is available
- `isLoading`: Loading state during availability check
- `hasAnyBiometric`: Computed property - true if any biometric is available

**Usage:**
The cubit is provided at the app level in `main.dart` and automatically checks availability on startup:
```dart
BiometricAvailabilityCubit(biometricAuthService)
  ..checkBiometricAvailability()
```

### 3. **BiometricLoginSection** (`lib/features/auth/presentation/login/widgets/biometric_login_section.dart`)
A widget that dynamically displays biometric login options based on availability.

**Features:**
- Only shows if at least one biometric method is available
- Displays Face ID icon if Face ID is available
- Displays Fingerprint icon if Fingerprint is available
- Shows both icons with spacing if both are available
- Navigates to the appropriate authentication screen when tapped

**Implementation:**
```dart
BlocBuilder<BiometricAvailabilityCubit, BiometricAvailabilityState>(
  builder: (context, state) {
    if (!state.hasAnyBiometric) {
      return const SizedBox.shrink(); // Hide if no biometrics
    }
    
    // Show available biometric buttons
    return Row(
      children: [
        if (state.isFingerprintAvailable) FingerprintButton(),
        if (state.isFaceIdAvailable) FaceIdButton(),
      ],
    );
  },
)
```

### 4. **Authentication Views**

#### **FaceIdView** (`lib/features/auth/presentation/login/views/face_id_view.dart`)
- **Type:** StatefulWidget
- **Behavior:** Automatically triggers Face ID authentication 500ms after the view loads
- **Success:** Navigates to `Routes.faceIdVerification` (success screen)
- **Failure:** Navigates back to login screen
- **Error Handling:** Logs errors and navigates back to login

#### **TouchIdView** (`lib/features/auth/presentation/login/views/touch_id_view.dart`)
- **Type:** StatefulWidget
- **Behavior:** Automatically triggers Fingerprint authentication 500ms after the view loads
- **Success:** Navigates to `Routes.touchIdVerification` (success screen)
- **Failure:** Navigates back to login screen
- **Error Handling:** Logs errors and navigates back to login

## User Flow

### Login Flow with Biometric Authentication

1. **User opens Login Screen**
   - `BiometricAvailabilityCubit` has already checked availability on app startup
   - `BiometricLoginSection` displays available biometric options

2. **User taps Face ID or Fingerprint icon**
   - Navigates to `FaceIdView` or `TouchIdView`

3. **Authentication Screen Loads**
   - After 500ms delay (to allow UI to render), authentication is triggered
   - System biometric prompt appears (OS-level)

4. **User authenticates**
   - **Success:** Navigate to success screen (`FaceIdSuccessView` or `TouchIdSuccessView`)
   - **Failure:** Navigate back to login screen
   - **Error:** Log error and navigate back to login screen

## Platform Configuration

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSFaceIDUsageDescription</key>
<string>We need Face ID to authenticate you securely</string>
```

## Testing

### Debug Widget
The app includes a `BiometricAvailabilityDebugWidget` that displays:
- Device support status
- Biometric check capability
- Face ID availability
- Fingerprint availability

This widget is shown on the login screen during development to verify biometric availability.

### Testing on Different Devices

**iOS Simulator:**
- Face ID: Hardware > Face ID > Enrolled
- Trigger authentication: Hardware > Face ID > Matching Face

**Android Emulator:**
- Settings > Security > Fingerprint
- Add fingerprint using extended controls (... button)
- Trigger authentication using extended controls

**Physical Devices:**
- Ensure biometric authentication is set up in device settings
- Test with actual Face ID or Fingerprint

## Code Example: Complete Authentication Flow

```dart
// 1. Check availability (done on app startup)
final cubit = BiometricAvailabilityCubit(biometricAuthService);
await cubit.checkBiometricAvailability();

// 2. Display available options in UI
BlocBuilder<BiometricAvailabilityCubit, BiometricAvailabilityState>(
  builder: (context, state) {
    if (state.isFaceIdAvailable) {
      // Show Face ID button
    }
    if (state.isFingerprintAvailable) {
      // Show Fingerprint button
    }
  },
)

// 3. Authenticate when user taps
final biometricService = BiometricAuthService();
final isAuthenticated = await biometricService.authenticate(
  localizedReason: 'Please authenticate to continue',
);

// 4. Handle result
if (isAuthenticated) {
  // Navigate to success screen
} else {
  // Navigate back or show error
}
```

## Security Considerations

1. **No Biometric Data Storage:** The app never stores biometric data. All authentication is handled by the OS.
2. **Fallback Authentication:** If biometric authentication fails, users can still use email/password.
3. **Platform Security:** Relies on platform-level biometric security (iOS Secure Enclave, Android Keystore).
4. **Error Handling:** All biometric operations are wrapped in try-catch blocks.

## Future Enhancements

1. **Biometric Enrollment:** Add screens to enroll biometrics during registration
2. **Settings Toggle:** Allow users to enable/disable biometric login in settings
3. **Retry Logic:** Add retry attempts for failed authentication
4. **Biometric Preference Storage:** Remember user's preferred biometric method
5. **Multi-factor Authentication:** Combine biometrics with other authentication methods

## Dependencies

```yaml
dependencies:
  local_auth: ^2.3.0
  flutter_bloc: ^8.1.6
```

## Troubleshooting

### Issue: Biometric icons not showing
**Solution:** Check that `BiometricAvailabilityCubit` is provided at the app level and `checkBiometricAvailability()` is called.

### Issue: Authentication not triggering
**Solution:** Ensure biometric permissions are configured in AndroidManifest.xml and Info.plist.

### Issue: Authentication fails immediately
**Solution:** Verify that biometric authentication is set up on the device/emulator.

### Issue: App crashes on authentication
**Solution:** Check that all platform-specific configurations are correct and the device supports biometrics.

## Summary

The biometric authentication implementation provides:
✅ **Availability Checking** - Detects available biometric methods
✅ **Dynamic UI** - Shows only available biometric options
✅ **Strong Authentication** - Uses platform-level biometric security
✅ **Error Handling** - Gracefully handles failures and errors
✅ **Clean Architecture** - Separates concerns with service, cubit, and UI layers
