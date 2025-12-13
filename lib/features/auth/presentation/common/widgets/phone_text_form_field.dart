import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PhoneTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: '01xxxxxxxxx',
      prefixIcon: Icons.phone_outlined,
      labelText: 'Phone',
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value)) {
          return 'Please enter a valid Egyptian phone number (e.g., 01xxxxxxxxx)';
        }
        return null;
      },
    );
  }
}
