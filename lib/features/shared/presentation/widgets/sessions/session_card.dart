import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';

class SessionCard extends StatelessWidget {
  final Session session;

  const SessionCard({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: AppShadows.blur4BlackOP25,
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.w),
            child: Column(
              children: [
                if (!isStudentRole(context)) ...[
                  Row(
                    children: [
                      const AppCircularAvatarImage(imageSize: 16),
                      4.horizontalSpace,
                      Text(
                        "${session.studentInfo.firstName} ${session.studentInfo.lastName}",
                        style: AppTextStyles.font12TextW500,
                      ),
                    ],
                  ),
                  const Divider(color: Color(0xffCACFD5)),
                ],
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  session.sessionDateTime.day.toString(),
                                  style: AppTextStyles.font20GoldenOrange600,
                                ),
                                Text(
                                  DateFormat.MMMM(
                                          getIt<AppPreferences>().getLang)
                                      .format(session.sessionDateTime),
                                  style: AppTextStyles.font10TextW400,
                                ),
                              ],
                            ),
                            2.horizontalSpace,
                            const VerticalDivider(
                              color: AppColors.goldenOrange,
                            ),
                            4.horizontalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 10.w,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xffE5ECF2),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: SvgPicture.asset(
                                Assets.images.laptop.path,
                                height: 20.w,
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.tr(LocaleKeys
                                        .student_scheduling_student_rescheduling_reschedule_sessionName),
                                    style: AppTextStyles.font10TextW500,
                                  ),
                                  Text(
                                    '${DateFormat(AppDate.hhmma).format(session.sessionDateTime)} - ${DateFormat(AppDate.hhmma).format(session.sessionDateTime.add(const Duration(minutes: 60)))}',
                                    style: AppTextStyles.font10TextW400OP6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffE5ECF2),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.w),
                            child: Text(
                              "60 ${context.tr(LocaleKeys.student_scheduling_student_rescheduling_reschedule_mins)}",
                              style: AppTextStyles.font10NavyBlueW400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (session.status.id == SessionStatus.incompleted.intValue)
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              Assets.icons.incompleteSession.path,
              width: 25.w,
              height: 25.w,
            ),
          ),
      ],
    );
  }
}
