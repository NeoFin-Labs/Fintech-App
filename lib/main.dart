import 'package:fintech_app/core/routes/app_routes.dart';
import 'package:fintech_app/fintech_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ensureScreenSize() must be called before runApp() to fix the issue of the text not being displayed in release mode
  await ScreenUtil.ensureScreenSize();
  runApp(const FintechApp(appRoutes: AppRoutes.instance));
}
