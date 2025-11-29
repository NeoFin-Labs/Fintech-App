import 'package:flutter/material.dart';
import 'package:fintech_app/core/theme/colors_extension.dart';

class BiometricLoginSection extends StatelessWidget {
  const BiometricLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or login with',
                style: TextStyle(color: colors.secondaryText, fontSize: 14),
              ),
            ),
            Expanded(
              child: Divider(
                color: colors.secondaryText.withValues(alpha: 0.3),
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _BiometricButton(
              icon: Icons.fingerprint,
              onTap: () {
                // TODO: Implement fingerprint authentication
              },
            ),
            const SizedBox(width: 48),
            _BiometricButton(
              icon: Icons.face,
              onTap: () {
                // TODO: Implement face ID authentication
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _BiometricButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _BiometricButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Icon(icon, size: 48, color: colors.iconSecondary),
      ),
    );
  }
}
