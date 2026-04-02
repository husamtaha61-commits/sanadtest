import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/styles/app_colors.dart';
import '../../theme/styles/app_text_style.dart';
import '../app_document_name_preview.dart';
import '../app_elevated_button.dart';

class AppStepsUserIdentityItem extends StatelessWidget {
  final String? assetImagePath;
  final String? pickedImageName;
  final String label;
  final String btnLabel;
  final void Function() onPressed;
  final void Function() onCancel;
  const AppStepsUserIdentityItem({
    super.key,
    this.assetImagePath,
    this.pickedImageName,
    required this.onCancel,
    required this.label,
    required this.btnLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(label),
            style: AppTextStyles.font16TextW400,
          ),
          28.verticalSpace,
          assetImagePath != null
              ? SvgPicture.asset(
                  assetImagePath!,
                  width: 260.w,
                  height: 160.w,
                )
              : AppDocumentNamePreview(
                  documentName: pickedImageName!,
                  removeDocument: onCancel,
                ),
          36.verticalSpace,
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: AppElevatedButton(
                onPressed: onPressed,
                fixedSize: Size(131.w, 40.w),
                elevation: 0,
                backgroundColor: const Color(0xffE5ECF2),
                textStyle: AppTextStyles.font15NavyBlueW400,
                foregroundColor: AppColors.navyBlue,
                child: Text(context.tr(btnLabel)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
