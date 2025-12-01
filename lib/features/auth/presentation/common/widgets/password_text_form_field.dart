import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      prefixIcon: Icons.lock_outline,
      labelText: 'Password',
      controller: widget.controller,
      validator: (value) {
        // check if the password is null or empty
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        // check if the password is less than 8 characters
        else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        // check if the password contains at least one uppercase letter
        else if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain at least one uppercase letter';
        }
        // check if the password contains at least one lowercase letter
        else if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must contain at least one lowercase letter';
        }
        // check if the password contains at least one number
        else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must contain at least one number';
        }
        // check if the password contains at least one special character
        else if (!value.contains(
          RegExp(r'[!@#\$%\^&\*\(\)\_\+\-=\[\]{};:",.<>/?]'),
        )) {
          return 'Password must contain at least one special character';
        }
        return null;
      },
      obscureText: _isObscured,
      suffixIcon: IconButton(
        icon: Icon(
          _isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      ),
    );
  }
}
