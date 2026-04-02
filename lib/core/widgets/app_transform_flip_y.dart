import 'package:flutter/material.dart';

class AppTransformFlipY extends StatelessWidget {
  final Widget child;
  final bool isFlip;
  const AppTransformFlipY(
      {super.key, required this.child, required this.isFlip});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipY: isFlip ? true : false,
      child: child,
    );
  }
}
