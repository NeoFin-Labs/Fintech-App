import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String passwordToMatch;

  const ConfirmPasswordTextFormField({
    super.key,
    required this.controller,
    required this.passwordToMatch,
  });

  @override
  State<ConfirmPasswordTextFormField> createState() =>
      _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Confirm Password',
      prefixIcon: Icons.lock_outline,
      labelText: 'Confirm Password',
      controller: widget.controller,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != widget.passwordToMatch) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
