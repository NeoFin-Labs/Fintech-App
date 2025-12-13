import 'package:fintech_app/core/di/injection_container.dart' as di;
import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/success/success.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/core/utils/snackbar_extension.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_background.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/auth_button.dart';
import 'package:fintech_app/features/auth/presentation/common/widgets/email_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<AuthCubit>(),
      child: const _ForgotPasswordContent(),
    );
  }
}

class _ForgotPasswordContent extends StatefulWidget {
  const _ForgotPasswordContent();

  @override
  State<_ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<_ForgotPasswordContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().resetPassword(_emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess && state.success is PasswordResetSuccess) {
            // Show success message
            context.showSuccessSnackBar(state.success.message!);
            // Navigate back to login
            context.pop();
          } else if (state is AuthFailure) {
            // Show error message
            context.showErrorSnackBar(state.message);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  VerticalSpace(40),

                  // Header
                  Text(
                    'Forgot Password?',
                    style: AppTextStyle.font32Bold,
                    textAlign: TextAlign.center,
                  ),
                  VerticalSpace(16),
                  Text(
                    'Enter your email address and we\'ll send you a link to reset your password.',
                    style: AppTextStyle.font14Regular,
                    textAlign: TextAlign.center,
                  ),

                  VerticalSpace(48),

                  // Email Input
                  EmailTextFormField(controller: _emailController),
                  VerticalSpace(32),

                  // Submit Button
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is AuthLoading;

                      return AuthButton(
                        isLoading: isLoading,
                        onPressed: _handleResetPassword,
                        buttonText: 'Send Reset Link',
                      );
                    },
                  ),

                  VerticalSpace(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
