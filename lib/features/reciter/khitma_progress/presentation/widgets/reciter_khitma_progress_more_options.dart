import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/config/app_config.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/presentation/bloc/student_progress/student_progress_cubit.dart';

class ReciterKhitmaProgressMoreOptions extends StatelessWidget {
  const ReciterKhitmaProgressMoreOptions({super.key});

  void showOptions(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return const _MoreOptionsContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showOptions(context),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset(
        Assets.icons.dots.path,
        width: 4.w,
      ),
    );
  }
}

class _MoreOptionsContent extends StatelessWidget {
  const _MoreOptionsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BottomSheetItem(
              text:
                  LocaleKeys.reciter_khitmaProgress_bottomSheet_updateSchedule,
              onTap: () => context.router.push(
                StudentUpdateScheduleRoute(fromStudentSide: false),
              ),
            ),
            // _BottomSheetItem(
            //   title: Text.rich(
            //     TextSpan(
            //       children: [
            //         TextSpan(
            //           text: context.tr(LocaleKeys
            //               .reciter_khitmaProgress_bottomSheet_requestNewSession),
            //           style: AppTextStyles.font16TextW400.copyWith(
            //             color: const Color(0xff003D7A),
            //           ),
            //         ),
            //         WidgetSpan(
            //           child: SizedBox(width: 5.w),
            //         ),
            //         TextSpan(
            //           text: context.tr(LocaleKeys
            //               .reciter_khitmaProgress_bottomSheet_extraSession),
            //           style: AppTextStyles.font12TextW400.copyWith(
            //             color: const Color(0xff003D7A).withOpacity(0.4),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            _BottomSheetItem(
              text:
                  LocaleKeys.reciter_khitmaProgress_bottomSheet_skillsandNotes,
              onTap: () => context.router.push(SkillsNotesRoute(
                  studentId:
                      context.read<StudentProgressCubit>().state.studentId)),
            ),
            _BottomSheetItem(
              leading: SvgPicture.asset(
                width: 18.w,
                Assets.icons.quran.path,
                colorFilter: const ColorFilter.mode(
                  AppColors.navyBlue,
                  BlendMode.srcIn,
                ),
              ),
              onTap: () => context.router.push(FullRoute(
                url: AppConfig.shared.quranPageUrl,
              )),
              text: LocaleKeys.reciter_khitmaProgress_bottomSheet_openQuran,
            ),
            _BottomSheetItem(
              onTap: () => context.router.push(StudentProfileRoute(
                  fromStudentSide: false,
                  studentId:
                      context.read<StudentProgressCubit>().state.studentId)),
              text: LocaleKeys
                  .reciter_khitmaProgress_bottomSheet_viewStudentProfile,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetItem extends StatelessWidget {
  final String? text;
  final Widget? title;
  final Widget? leading;
  final void Function()? onTap;
  const _BottomSheetItem({this.text, this.leading, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () {
              onTap!();
              context.router.popForced();
            }
          : () {},
      child: ListTile(
        horizontalTitleGap: 10.w,
        leading: leading,
        title: title ??
            Text(
              context.tr(text!),
              style: AppTextStyles.font16TextW400.copyWith(
                color: const Color(0xff003D7A),
              ),
            ),
      ),
    );
  }
}
