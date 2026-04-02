import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/translations/locale_keys.g.dart';
import '../../utils/device_manager.dart';
import '../app_text_field.dart';

class AppSearchField extends StatelessWidget {
  final Function(String) onFieldSubmitted;
  final Function() onPressed;
  final TextEditingController textEditingController;
  final Widget? icon;
  final Color iconColor;
  final String hintText;
  final void Function(String?)? onChanged;
  const AppSearchField({
    super.key,
    required this.onFieldSubmitted,
    required this.onPressed,
    required this.textEditingController,
    this.icon,
    this.hintText = LocaleKeys.student_scheduling_reciterListing_search,
    this.iconColor = const Color(0xff636173),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onFieldSubmitted,
      suffixIcon: IconButton(
        padding: DeviceManager.isTablet(context)
            ? EdgeInsets.symmetric(horizontal: 12.w)
            : null,
        onPressed: onPressed,
        icon: icon ??
            SvgPicture.asset(
              Assets.icons.search.path,
              width: 20.w,
              height: 20.w,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
      ),
      textEditingController: textEditingController,
      hintText: context.tr(hintText),
    );
  }
}
