import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

class ReciterSubmitJobCertificatesUploadRecitationDocument
    extends StatelessWidget {
  final VoidCallback uploadDocument;
  final VoidCallback removeDocument;

  final String recitation;
  final String recitationType;

  const ReciterSubmitJobCertificatesUploadRecitationDocument({
    super.key,
    required this.uploadDocument,
    required this.removeDocument,
    required this.recitation,
    required this.recitationType,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: 8.w, top: 17.w, bottom: 17.w, right: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            boxShadow: AppShadows.blur4BlackOP25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  "${context.tr(LocaleKeys.reciter_submitJob_certificates_recitationDocument)} $recitation ($recitationType)",
                  softWrap: true,
                  style: AppTextStyles.font14TextW500,
                ),
              ),
              GestureDetector(
                onTap: uploadDocument,
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: const Color(0xffE5ECF2),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.upload.path,
                    width: 18.w,
                    height: 18.w,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          end: 0,
          child: FractionalTranslation(
              translation: const Offset(0.45, -0.5),
              child: IconButton(
                visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
                onPressed: removeDocument,
                icon: CircleAvatar(
                  backgroundColor: AppColors.errorColor,
                  radius: 10.r,
                  child: SvgPicture.asset(
                    width: 8.w,
                    height: 8.w,
                    Assets.icons.cancel.path,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
