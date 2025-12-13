import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.onChanged,
    required this.colors,
    required this.value,
  });

  final ValueChanged<bool?> onChanged;
  final AppColors colors;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 24.h,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: colors.primaryText.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
    );
  }
}
