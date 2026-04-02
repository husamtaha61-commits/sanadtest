import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuDivider extends StatelessWidget {
  const MenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromRGBO(153, 163, 176, 0.4),
      height: 1,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
