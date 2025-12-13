import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;

  const NameTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: hintText ?? 'Name',
      prefixIcon: Icons.person_outline,
      labelText: labelText ?? 'Name',
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${(labelText ?? 'name').toLowerCase()}';
        }
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
          return 'Please enter a valid name (letters and spaces only)';
        }
        return null;
      },
    );
  }
}
