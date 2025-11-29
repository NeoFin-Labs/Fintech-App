import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'E-mail ID',
      prefixIcon: Icons.email_outlined,
      labelText: 'E-mail ID',
      controller: TextEditingController(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
    );
  }
}
