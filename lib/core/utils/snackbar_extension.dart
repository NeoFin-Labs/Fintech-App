import 'package:fintech_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension on BuildContext to show success and error snackbars
extension SnackbarExtension on BuildContext {
  /// Shows a success snackbar with a green background and checkmark icon
  ///
  /// [message] - The message to display
  /// [duration] - How long to show the snackbar (default: 3 seconds)
  /// [action] - Optional action button
  void showSuccessSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: AppColorsLight.white, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: AppColorsLight.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColorsLight.safePrimary,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Shows an error snackbar with a red background and error icon
  ///
  /// [message] - The error message to display
  /// [duration] - How long to show the snackbar (default: 4 seconds)
  /// [action] - Optional action button (e.g., "Retry")
  void showErrorSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: AppColorsLight.white, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: AppColorsLight.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColorsLight.dangerSecondary,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Shows an info snackbar with a blue background and info icon
  ///
  /// [message] - The info message to display
  /// [duration] - How long to show the snackbar (default: 3 seconds)
  /// [action] - Optional action button
  void showInfoSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info, color: AppColorsLight.white, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: AppColorsLight.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColorsLight.primary,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Shows a warning snackbar with an orange background and warning icon
  ///
  /// [message] - The warning message to display
  /// [duration] - How long to show the snackbar (default: 3 seconds)
  /// [action] - Optional action button
  void showWarningSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning, color: AppColorsLight.white, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: AppColorsLight.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFF9800), // Orange for warning
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Hides any currently displayed snackbar
  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}
