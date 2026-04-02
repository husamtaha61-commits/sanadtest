import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/extenstions/date_time.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../core/widgets/pictures/app_circular_avatar_image.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';
import '../../../../student/rescheduling/presentation/bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';

class WeekSessionsListItem extends StatelessWidget {
  final Session session;

  const WeekSessionsListItem({super.key, required this.session});

  void _showMoreOptions(BuildContext context, bool isComingSession) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => BlocProvider.value(
        value: context.read<StudentRescheduleSessionsCubit>(),
        child: _MoreOptionsContent(
          session: session,
          isComingSession: isComingSession,
        ),
      ),
    );
  }

  bool get isComingSession =>
      session.status.id == SessionStatus.upcoming.intValue;
  bool get isCompletedSession =>
      session.status.id == SessionStatus.completed.intValue;
  bool get isInCompletedSession =>
      session.status.id == SessionStatus.incompleted.intValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.w),
      child: Row(
        children: [
          Expanded(
            child: AppShadowContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _SessionDetails(session: session),
                  ),
                  if (isComingSession)
                    _MoreOptionsIcon(
                      onPressed: () =>
                          _showMoreOptions(context, isComingSession),
                    ),
                  if (isInCompletedSession) _StatusIcon(session: session),
                ],
              ),
            ),
          ),
          if (isCompletedSession || isInCompletedSession) ...[
            8.horizontalSpace,
            SvgPicture.asset(
              isCompletedSession
                  ? Assets.icons.checkComplete.path
                  : Assets.icons.checkIncomplete.path,
              width: 18.w,
              height: 18.w,
            ),
          ],
        ],
      ),
    );
  }
}

class _SessionDetails extends StatelessWidget {
  final Session session;
  const _SessionDetails({required this.session});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _SessionDate(sessionDateTime: session.sessionDateTime),
          2.horizontalSpace,
          const VerticalDivider(color: AppColors.goldenOrange),
          4.horizontalSpace,
          isStudentRole(context)
              ? Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffE5ECF2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    Assets.images.laptop.path,
                    height: 20.w,
                  ),
                )
              : const AppCircularAvatarImage(imageSize: 40),
          5.horizontalSpace,
          Flexible(child: _SessionTime(session: session)),
        ],
      ),
    );
  }
}

class _SessionDate extends StatelessWidget {
  final DateTime sessionDateTime;

  const _SessionDate({required this.sessionDateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sessionDateTime.day.toString(),
          style: AppTextStyles.font20GoldenOrange600,
        ),
        Text(
          sessionDateTime.toStr('MMM', localized: true),
          style: AppTextStyles.font10TextW400,
        ),
      ],
    );
  }
}

class _SessionTime extends StatelessWidget {
  final Session session;

  const _SessionTime({required this.session});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isStudentRole(context)
            ? Text(
                context.tr(LocaleKeys
                    .student_scheduling_student_rescheduling_reschedule_sessionName),
                style: AppTextStyles.font12TextW500,
              )
            : Text(
                "${session.studentInfo.firstName} ${session.studentInfo.lastName}",
                style: AppTextStyles.font12TextW500,
              ),
        Text(
          '${session.sessionDateTime.toStr(AppDate.hhmma, localized: true)} - ${AppDate.getSessionEndTime(session.sessionDateTime)}',
          style: AppTextStyles.font12TextW400OP6,
        ),
      ],
    );
  }
}

class _MoreOptionsIcon extends StatelessWidget {
  final void Function()? onPressed;
  const _MoreOptionsIcon({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 30.w,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: SvgPicture.asset(
          Assets.icons.dots.path,
          width: 17.w,
          height: 17.w,
        ),
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final Session session;
  const _StatusIcon({required this.session});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: AppElevatedButton(
        onPressed: () => context.router.push(StudentRescheduleSessionRoute(
            session: session, isComingSession: false)),
        padding: EdgeInsets.zero,
        child: SvgPicture.asset(
          Assets.icons.timeWhite.path,
          width: 12.w,
          height: 12.w,
        ),
      ),
    );
  }
}

class _MoreOptionsContent extends StatelessWidget {
  final Session session;
  final bool isComingSession;
  const _MoreOptionsContent(
      {required this.session, required this.isComingSession});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppElevatedButton(
              onPressed: () {
                context.router.popForced();
                context.router.push(StudentRescheduleSessionRoute(
                  session: session,
                  isComingSession: isComingSession,
                ));
              },
              child: Text(context.tr(LocaleKeys.button_rescheduleSession)),
            ),
            12.verticalSpace,
            Center(
              child: InkWell(
                onTap: () async {
                  if (session.type.id == 10) {
                    await showAppModalBottomSheet(
                      context: context,
                      title: LocaleKeys.modalBottomSheet_title_alright,
                      subTitle: LocaleKeys.modalBottomSheet_subTitle_st20,
                      mainBtnLabel: LocaleKeys.button_ok,
                      mainOnPressed: () => context.router.popForced(),
                      isDismissible: true,
                      imagePath: Assets.images.questionPopup.path,
                    );
                    return;
                  }
                  context
                      .read<StudentRescheduleSessionsCubit>()
                      .cancelSession(session.sessionId);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
                  child: Text(
                    context.tr(LocaleKeys.button_cancelSession),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14TextW500.copyWith(
                      color: const Color(0xFFF22D2D),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
