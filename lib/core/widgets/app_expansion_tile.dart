import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extenstions/alignment_extension.dart';

class AppExpansionTile extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final Color? collapsedBackgroundColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? childrenPadding;
  final EdgeInsetsGeometry? tilePadding;
  final Color? collapsedIconColor;
  final Color? iconColor;
  final ShapeBorder? collapsedShape;
  final ShapeBorder? shape;
  final void Function(bool)? onExpansionChanged;
  final bool? initiallyExpanded;
  const AppExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.collapsedBackgroundColor,
    this.backgroundColor,
    this.childrenPadding,
    this.tilePadding,
    this.collapsedIconColor,
    this.iconColor,
    this.collapsedShape,
    this.shape,
    this.onExpansionChanged,
    this.initiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft.localized(context),
      visualDensity: VisualDensity.compact,
      initiallyExpanded: initiallyExpanded ?? false,
      childrenPadding: childrenPadding ?? EdgeInsets.symmetric(horizontal: 0.w),
      tilePadding: tilePadding ?? EdgeInsets.symmetric(horizontal: 0.w),
      dense: true,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedShape: collapsedShape ?? const RoundedRectangleBorder(),
      shape: shape ?? const RoundedRectangleBorder(),
      collapsedBackgroundColor: collapsedBackgroundColor,
      backgroundColor: backgroundColor,
      collapsedIconColor: collapsedIconColor,
      iconColor: iconColor,
      onExpansionChanged: onExpansionChanged,
      title: title,
      children: children,
    );
  }
}
