import 'package:fintech_app/core/di/injection_container.dart';
import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/routes/navigation_extension.dart';
import 'package:fintech_app/core/routes/routes.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';
import 'package:fintech_app/core/utils/app_text_style.dart';
import 'package:fintech_app/features/auth/presentation/common/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text(
            'Home',
            style: AppTextStyle.font20Bold.copyWith(
              color: Theme.of(context).appColors.primaryText,
            ),
          ),
          const VerticalSpace(20),
          BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  context.pushReplacementNamed(Routes.login);
                }
              },
              child: Builder(
                builder: (innerContext) {
                  return ElevatedButton(
                    onPressed: () {
                      innerContext.read<AuthCubit>().logout();
                    },
                    child: Text('Logout'),
                  );
                },
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
