import 'package:fintech_app/core/routes/app_routes.dart';
import 'package:fintech_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FintechApp extends StatelessWidget {
  const FintechApp({super.key, required this.appRoutes});
  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Fintech App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
