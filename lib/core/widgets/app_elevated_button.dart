import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Size? fixedSize;
  final OutlinedBorder? shape;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final double? elevation;
  final Widget child;
  final Size? maximumSize;
  final BorderSide? borderSide;
  final Color? overlayColor;
  const AppElevatedButton({
    super.key,
    this.backgroundColor,
    this.fixedSize,
    this.padding,
    this.shape,
    this.onPressed,
    required this.child,
    this.textStyle,
    this.foregroundColor,
    this.elevation,
    this.maximumSize,
    this.borderSide,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).elevatedButtonTheme.style;
    return ElevatedButton(
      style: buttonStyle?.copyWith(
        side: WidgetStatePropertyAll(borderSide),
        textStyle: WidgetStatePropertyAll(textStyle),
        foregroundColor: WidgetStatePropertyAll(foregroundColor),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStatePropertyAll(shape),
        fixedSize: WidgetStatePropertyAll(fixedSize),
        padding: WidgetStatePropertyAll(padding),
        elevation: WidgetStatePropertyAll(elevation),
        maximumSize: WidgetStatePropertyAll(maximumSize),
        overlayColor: WidgetStatePropertyAll(overlayColor),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
