import 'package:flutter/material.dart';

import '../di/injection.dart';
import '../services/app_preferences.dart';

class AppTransformFlipX extends StatelessWidget {
  final Widget child;
  const AppTransformFlipX({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isAr = getIt<AppPreferences>().isAr;

    return Transform.flip(
      flipX: isAr ? true : false,
      child: child,
    );
  }
}
