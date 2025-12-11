# State Refactoring: From copyWith to Sealed Classes

## ✅ What Changed

The `BiometricAvailabilityState` has been refactored from a single class with `copyWith` to a **sealed class hierarchy** with distinct state types. This makes the code more type-safe, explicit, and easier to maintain.

## 🔄 Before vs After

### Before (copyWith Pattern)
```dart
class BiometricAvailabilityState {
  final bool isDeviceSupported;
  final bool canCheckBiometrics;
  final bool isFaceIdAvailable;
  final bool isFingerprintAvailable;
  final bool isStrongBiometricAvailable;
  final bool isLoading;

  BiometricAvailabilityState copyWith({
    bool? isDeviceSupported,
    bool? canCheckBiometrics,
    // ... more parameters
  });
}

// Usage in Cubit
emit(state.copyWith(isLoading: true));
emit(state.copyWith(
  isDeviceSupported: true,
  isLoading: false,
));
```

**Problems:**
- ❌ All states use the same class
- ❌ Hard to distinguish between loading, success, and error states
- ❌ Easy to forget to set `isLoading: false`
- ❌ No compile-time guarantees about state validity

### After (Sealed Classes)
```dart
sealed class BiometricAvailabilityState {}

class BiometricAvailabilityInitial extends BiometricAvailabilityState {}

class BiometricAvailabilityLoading extends BiometricAvailabilityState {}

class BiometricAvailabilitySuccess extends BiometricAvailabilityState {
  final bool isDeviceSupported;
  final bool canCheckBiometrics;
  final bool isFaceIdAvailable;
  final bool isFingerprintAvailable;
  final bool isStrongBiometricAvailable;
  
  bool get hasStrongBiometric => isStrongBiometricAvailable;
}

class BiometricAvailabilityError extends BiometricAvailabilityState {
  final String? message;
}

// Usage in Cubit
emit(const BiometricAvailabilityLoading());
emit(BiometricAvailabilitySuccess(
  isDeviceSupported: true,
  canCheckBiometrics: true,
  // ...
));
emit(BiometricAvailabilityError(message: 'Failed'));
```

**Benefits:**
- ✅ Each state is a distinct type
- ✅ Clear separation between loading, success, and error
- ✅ Impossible to have invalid state combinations
- ✅ Compile-time safety with pattern matching
- ✅ More explicit and readable code

## 📊 State Hierarchy

```
BiometricAvailabilityState (sealed)
    ├── BiometricAvailabilityInitial
    ├── BiometricAvailabilityLoading
    ├── BiometricAvailabilitySuccess
    │   ├── isDeviceSupported
    │   ├── canCheckBiometrics
    │   ├── isFaceIdAvailable
    │   ├── isFingerprintAvailable
    │   ├── isStrongBiometricAvailable
    │   ├── hasAnyBiometric (getter)
    │   └── hasStrongBiometric (getter)
    └── BiometricAvailabilityError
        └── message
```

## 🎯 State Transitions

```
Initial → Loading → Success
                 ↘ Error
```

### Flow Diagram
```
App Starts
    ↓
BiometricAvailabilityInitial
    ↓
checkBiometricAvailability() called
    ↓
BiometricAvailabilityLoading
    ↓
    ├─ Success → BiometricAvailabilitySuccess
    │              (with all biometric data)
    │
    └─ Failure → BiometricAvailabilityError
                  (with error message)
```

## 🔧 Updated Components

### 1. BiometricAvailabilityState (New)
```dart
sealed class BiometricAvailabilityState {
  const BiometricAvailabilityState();
}

class BiometricAvailabilityInitial extends BiometricAvailabilityState {
  const BiometricAvailabilityInitial();
}

class BiometricAvailabilityLoading extends BiometricAvailabilityState {
  const BiometricAvailabilityLoading();
}

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

  bool get hasAnyBiometric => isFaceIdAvailable || isFingerprintAvailable;
  bool get hasStrongBiometric => isStrongBiometricAvailable;
}

class BiometricAvailabilityError extends BiometricAvailabilityState {
  final String? message;
  const BiometricAvailabilityError({this.message});
}
```

### 2. BiometricAvailabilityCubit (Updated)
```dart
class BiometricAvailabilityCubit extends Cubit<BiometricAvailabilityState> {
  BiometricAvailabilityCubit(this._biometricAuthService)
      : super(const BiometricAvailabilityInitial());  // Initial state

  Future<void> checkBiometricAvailability() async {
    emit(const BiometricAvailabilityLoading());  // Loading state

    try {
      // ... check biometrics ...
      
      emit(BiometricAvailabilitySuccess(  // Success state
        isDeviceSupported: isDeviceSupported,
        // ... all properties ...
      ));
    } catch (e) {
      emit(BiometricAvailabilityError(  // Error state
        message: 'Failed to check biometric availability: $e',
      ));
    }
  }
}
```

### 3. BiometricLoginSection (Updated with Pattern Matching)
```dart
return BlocBuilder<BiometricAvailabilityCubit, BiometricAvailabilityState>(
  builder: (context, state) {
    // Use pattern matching (switch expression)
    return switch (state) {
      BiometricAvailabilityInitial() => const SizedBox.shrink(),
      BiometricAvailabilityLoading() => const SizedBox.shrink(),
      BiometricAvailabilityError() => const SizedBox.shrink(),
      BiometricAvailabilitySuccess() => _buildBiometricSection(
          context,
          colors,
          state,  // state is automatically cast to Success type
        ),
    };
  },
);
```

### 4. BiometricAvailabilityDebugWidget (Updated)
```dart
return switch (state) {
  BiometricAvailabilityInitial() => _buildInitialState(colors),
  BiometricAvailabilityLoading() => _buildLoadingState(colors),
  BiometricAvailabilityError(:final message) => 
    _buildErrorState(colors, message),  // Extract message
  BiometricAvailabilitySuccess() => _buildSuccessState(colors, state),
};
```

## 🎨 Pattern Matching Benefits

### Exhaustiveness Checking
```dart
// Compiler ensures ALL states are handled
return switch (state) {
  BiometricAvailabilityInitial() => ...,
  BiometricAvailabilityLoading() => ...,
  BiometricAvailabilitySuccess() => ...,
  BiometricAvailabilityError() => ...,
  // If you forget one, you get a compile error!
};
```

### Type Safety
```dart
// In the Success case, state is automatically cast
BiometricAvailabilitySuccess() => _buildBiometricSection(
  context,
  colors,
  state,  // state is BiometricAvailabilitySuccess, not base type
)

// You can access Success-specific properties
void _buildBiometricSection(
  BuildContext context,
  AppColors colors,
  BiometricAvailabilitySuccess state,  // Specific type
) {
  // Can safely access state.isFaceIdAvailable, etc.
  if (state.hasStrongBiometric) { ... }
}
```

### Property Extraction
```dart
// Extract properties directly in the pattern
BiometricAvailabilityError(:final message) => 
  _buildErrorState(colors, message)
  
// Equivalent to:
BiometricAvailabilityError() => {
  final message = (state as BiometricAvailabilityError).message;
  return _buildErrorState(colors, message);
}
```

## 📝 Migration Guide

### Old Code (copyWith)
```dart
// Cubit
emit(state.copyWith(isLoading: true));
emit(state.copyWith(
  isDeviceSupported: true,
  isLoading: false,
));

// UI
if (state.isLoading) {
  return CircularProgressIndicator();
}
if (state.hasStrongBiometric) {
  return BiometricIcons();
}
```

### New Code (Sealed Classes)
```dart
// Cubit
emit(const BiometricAvailabilityLoading());
emit(BiometricAvailabilitySuccess(
  isDeviceSupported: true,
  // ... all required properties
));

// UI
return switch (state) {
  BiometricAvailabilityLoading() => CircularProgressIndicator(),
  BiometricAvailabilitySuccess() when state.hasStrongBiometric => 
    BiometricIcons(),
  _ => SizedBox.shrink(),
};
```

## ✅ Advantages of Sealed Classes

1. **Type Safety**
   - Compiler ensures all states are handled
   - No runtime errors from missing state checks

2. **Explicit States**
   - Clear distinction between loading, success, error
   - Impossible to have invalid state combinations

3. **Better IDE Support**
   - Autocomplete knows exact state type
   - Refactoring is safer

4. **Cleaner Code**
   - No need for `copyWith` boilerplate
   - Pattern matching is more readable

5. **Maintainability**
   - Adding new states is explicit
   - Compiler helps you update all usages

## 🧪 Testing

### Before (copyWith)
```dart
test('should emit loading state', () {
  // Hard to verify exact state
  expect(state.isLoading, true);
  expect(state.isDeviceSupported, false);  // Need to check all fields
});
```

### After (Sealed Classes)
```dart
test('should emit loading state', () {
  // Clear and explicit
  expect(state, isA<BiometricAvailabilityLoading>());
});

test('should emit success state with data', () {
  expect(state, isA<BiometricAvailabilitySuccess>());
  final successState = state as BiometricAvailabilitySuccess;
  expect(successState.hasStrongBiometric, true);
});
```

## 🚀 Summary

### What You Gained
- ✅ **Type-safe state management** with sealed classes
- ✅ **Pattern matching** for cleaner state handling
- ✅ **Explicit state transitions** (Initial → Loading → Success/Error)
- ✅ **Compile-time safety** - can't forget to handle a state
- ✅ **Better code organization** - each state is its own class
- ✅ **Easier testing** - states are distinct types

### Files Changed
1. `biometric_availability_state.dart` - Sealed class hierarchy
2. `biometric_availability_cubit.dart` - Emit distinct states
3. `biometric_login_section.dart` - Pattern matching
4. `biometric_availability_debug_widget.dart` - Pattern matching

### No Breaking Changes
The public API remains the same:
- `hasStrongBiometric` getter still works
- `isFaceIdAvailable` still accessible
- UI behavior unchanged

**Your code is now more robust, type-safe, and maintainable!** 🎉
