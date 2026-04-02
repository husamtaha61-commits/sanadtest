import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_transform_flip_x.dart';
import '../../../../gen/assets.gen.dart';

class AccountSettingsListTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AccountSettingsListTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 21.w),
      trailing: AppTransformFlipX(
          child: SvgPicture.asset(Assets.icons.arrowRightAngel.path)),
      title: Text(
        context.tr(title),
        style: AppTextStyles.font16TextW500,
      ),
    );
  }
}
