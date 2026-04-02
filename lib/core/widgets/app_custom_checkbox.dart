import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../gen/assets.gen.dart';

class AppCustomCheckbox extends StatefulWidget {
  final bool value;
  final Widget child;

  const AppCustomCheckbox(
      {super.key, required this.value, required this.child});

  @override
  State<AppCustomCheckbox> createState() => _AppCustomCheckboxState();
}

class _AppCustomCheckboxState extends State<AppCustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 15.w,
          height: 15.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: const Color.fromRGBO(99, 97, 115, 1),
              width: 1.25.w,
            ),
          ),
          child: widget.value
              ? Center(
                  child: SvgPicture.asset(
                  Assets.icons.check.path,
                  width: 8.w,
                  height: 8.w,
                ))
              : null,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Opacity(
              opacity: 0.8,
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
