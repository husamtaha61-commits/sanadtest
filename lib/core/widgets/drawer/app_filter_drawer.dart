import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_filter_drawer_action_buttons.dart';

class AppFilterDrawer extends StatelessWidget {
  final Widget child;
  final void Function() onReset;
  final void Function() onApply;

  const AppFilterDrawer({
    super.key,
    required this.child,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Drawer(
            width: 325.w,
            child: Stack(
              children: [
                child,
                AppFilterDrawerActionButtons(
                  onReset: onReset,
                  onApply: onApply,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
