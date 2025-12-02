import 'package:fintech_app/core/helper/spacing.dart';
import 'package:fintech_app/core/utils/app_assets.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/face_id_scanner.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/instruction_text.dart';
import 'package:fintech_app/features/auth/presentation/login/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class FaceIdView extends StatelessWidget {
  const FaceIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(AppAssets.faceIdBackground, fit: BoxFit.cover),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Top spacing
                const VerticalSpace(100),
                const Spacer(),

                // Face ID Icon with animation
                const FaceIdScanner(),

                const VerticalSpace(60),

                // Instruction text
                const InstructionText(),

                const Spacer(),

                // Loading indicator
                const LoadingIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
