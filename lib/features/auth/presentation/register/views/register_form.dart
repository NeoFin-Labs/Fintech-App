import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_button.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/confirm_password_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/email_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/name_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/password_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/phone_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // First Name field
          NameTextFormField(
            controller: _firstNameController,
            labelText: 'First Name',
            hintText: 'First Name',
          ),
          VerticalSpace(12),

          // Last Name field
          NameTextFormField(
            controller: _lastNameController,
            labelText: 'Last Name',
            hintText: 'Last Name',
          ),
          VerticalSpace(12),

          // Email field
          EmailTextFormField(controller: _emailController),
          VerticalSpace(12),

          // Password field
          PasswordTextFormField(controller: _passwordController),
          VerticalSpace(12),

          // Confirm Password field
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _passwordController,
            builder: (context, value, child) {
              return ConfirmPasswordTextFormField(
                controller: _confirmPasswordController,
                passwordToMatch: value.text,
              );
            },
          ),
          VerticalSpace(12),

          // Phone field
          PhoneTextFormField(controller: _phoneController),

          VerticalSpace(24),

          // Register button
          AuthButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.pushNamed(Routes.setFingerprint);
              }
            },
            buttonText: 'Register',
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
