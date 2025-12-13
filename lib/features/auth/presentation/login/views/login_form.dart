import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/utils/snackbar_extension.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_button.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/email_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/password_text_form_field.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/remember_me_and_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';

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
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.pushReplacementNamed(Routes.home);
              } else if (state is AuthFailure) {
                context.showErrorSnackBar(state.message);
              }
            },
            builder: (context, state) {
              return AuthButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                      _emailController.text,
                      _passwordController.text,
                    );
                  }
                },
                buttonText: 'Login',
                isLoading: state is AuthLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
