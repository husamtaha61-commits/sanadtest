import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppDirectionality extends StatelessWidget {
  final String text;
  final Widget child;
  const AppDirectionality({super.key, required this.child, required this.text});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: getTextDirection(text), child: child);
  }
}
