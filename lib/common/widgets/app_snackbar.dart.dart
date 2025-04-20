// lib/common/widgets/app_snackbar.dart

import 'package:flutter/material.dart';

enum SnackType { success, error, normal }

class AppSnackbar {
  static void show(
    BuildContext context,
    String message, {
    SnackType type = SnackType.normal,
  }) {
    final scheme = Theme.of(context).colorScheme;

    // Choose colors & icons based on type
    late Color backgroundColor;
    late Color iconColor;
    late IconData icon;

    switch (type) {
      case SnackType.success:
        backgroundColor = Colors.green; // More vibrant green
        iconColor = scheme.onPrimaryContainer;
        icon = Icons.check_circle_outline;
        break;
      case SnackType.error:
        backgroundColor = scheme.error;
        iconColor = scheme.onError;
        icon = Icons.error_outline;
        break;
      case SnackType.normal:
        backgroundColor = scheme.primaryContainer; // Moved from success
        iconColor = scheme.onPrimaryContainer;
        icon = Icons.info_outline;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
            Expanded(child: Text(message, style: TextStyle(color: iconColor))),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
