import 'package:flutter/widgets.dart';

class AppDirectionalityLTR extends StatelessWidget {
  final Widget child;
  const AppDirectionalityLTR({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: child);
  }
}
