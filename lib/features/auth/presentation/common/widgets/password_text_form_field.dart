import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      prefixIcon: Icons.lock_outline,
      labelText: 'Password',
      controller: TextEditingController(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
