import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Name',
      prefixIcon: Icons.person_outline,
      labelText: 'Name',
      controller: TextEditingController(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}
