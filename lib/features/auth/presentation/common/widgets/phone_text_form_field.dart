import 'package:fintech_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Phone',
      prefixIcon: Icons.phone_outlined,
      labelText: 'Phone',
      controller: TextEditingController(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }
}
