import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_button.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/email_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/password_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/remember_me_and_forget_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late bool _rememberMe;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _rememberMe = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextFormField(controller: _emailController),
          VerticalSpace(12),
          // Password field
          PasswordTextFormField(controller: _passwordController),
          VerticalSpace(12),
          // Remember me and Forget Password
          RememberMeAndForgetPassword(
            onChanged: (value) {
              setState(() {
                _rememberMe = value!;
              });
            },
            value: _rememberMe,
          ),

          VerticalSpace(24),

          // Login button
          AuthButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement login logic
              }
            },
            buttonText: 'Login',
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
