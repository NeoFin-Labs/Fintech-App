import 'package:fintech_app/core/routes/app_routes.dart';
import 'package:fintech_app/fintech_app.dart';
import 'package:fintech_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fintech_app/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // ensureScreenSize() must be called before runApp() to fix the issue of the text not being displayed in release mode
  await ScreenUtil.ensureScreenSize();
  await di.init();
  runApp(const FintechApp(appRoutes: AppRoutes.instance));
}
