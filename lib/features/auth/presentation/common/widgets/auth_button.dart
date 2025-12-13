import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String buttonText;

  const AuthButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? CircularProgressIndicator(
              color: colors.elevatedButtonFgColor,
              strokeWidth: 2.sp,
            )
          : Text(buttonText),
    );
  }
}
