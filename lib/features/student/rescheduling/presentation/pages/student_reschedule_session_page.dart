import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/snackbar.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_elevated_button.dart';

import '../../../../../core/widgets/form_fields/app_text_area_field.dart';
import '../../../../../core/widgets/steps/app_steps_button_container.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/widgets/sessions/session_card.dart';
import '../../domain/entites/session.dart';
import '../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import '../widgets/student_reschedule/student_reschedule_bloc_wrapper.dart';
import '../widgets/student_reschedule/student_reschedule_days_list.dart';
import '../widgets/student_reschedule/student_reschedule_suggested_sessions.dart';
import '../widgets/student_reschedule/student_reschedule_times_list.dart';

@RoutePage()
class StudentRescheduleSessionPage extends StatelessWidget {
  final Session session;
  final bool isComingSession;
  const StudentRescheduleSessionPage({
    super.key,
    required this.session,
    required this.isComingSession,
  });

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: StudentRescheduleBlocWrapper(
        isComingSession: isComingSession,
        child: _StudentRescheduleSessionContent(
          session: session,
          isComingSession: isComingSession,
        ),
      ),
    );
  }
}

class _StudentRescheduleSessionContent extends StatelessWidget {
  final Session session;
  final bool isComingSession;

  const _StudentRescheduleSessionContent(
      {required this.session, required this.isComingSession});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = getIt<AppRouter>();
    final studentRescheduleSessionsCubit =
        context.read<StudentRescheduleSessionsCubit>();
    return AppCustomScrollView(
      appPageHeader: AppPageHeader.subtitle,
      title: isComingSession
          ? LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_rescheduleSessionTitle
          : LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_makeupSessionTitle,
      bottomChildren: [
        AppStepsButtonContainer(
          children: [
            BlocBuilder<StudentRescheduleSessionsCubit,
                StudentRescheduleSessionsState>(
              builder: (context, state) => AppElevatedButton(
                onPressed: state.suggestedSessions.isEmpty
                    ? null
                    : () async {
                        // If session type is 10, show a warning dialog and do not proceed
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

                        // Otherwise proceed with makeup or one-time reschedule based on status
                        final isMakeupStatus = [
                          SessionStatus.incompleted.intValue,
                          SessionStatus.cancelled.intValue,
                        ].contains(session.status.id);

                        if (isMakeupStatus) {
                          studentRescheduleSessionsCubit
                              .makeupSession(session.sessionId);
                        } else {
                          studentRescheduleSessionsCubit
                              .reschduleSessionOnce(session.sessionId);
                        }
                      },
                child: Text(
                  context.tr(LocaleKeys.button_sendRequest),
                ),
              ),
            ),
            12.verticalSpace,
            if (isComingSession)
              Material(
                child: InkWell(
                  onTap: () async {
                    // If session type is 10, show a warning dialog and do not proceed
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
                    showAppLoadingDialog(context);
                    bool isValid = await studentRescheduleSessionsCubit
                        .validateCancellation(session.sessionId);
                    await appRouter.maybePop();
                    if (isValid) {
                      showAppModalBottomSheet(
                        context: context,
                        title: LocaleKeys.modalBottomSheet_title_cancelSession,
                        subTitle: LocaleKeys.modalBottomSheet_subTitle_st9,
                        mainOnPressed: () {
                          context.router.popForced();
                          studentRescheduleSessionsCubit
                              .cancelSession(session.sessionId);
                        },
                        mainBtnLabel: LocaleKeys.button_yes,
                        secBtnLabel: LocaleKeys.button_cancel,
                        secOnPressed: () => appRouter.maybePop(),
                        isDismissible: true,
                        imagePath: Assets.images.questionPopup.path,
                      );
                    } else {
                      showSnackBar(
                          context,
                          LocaleKeys.modalBottomSheet_subTitle_st12.tr(),
                          SnackBarStatus.error);
                    }
                  },
                  child: Text(
                    context.tr(LocaleKeys.button_cancelSession),
                    style: AppTextStyles.font15TextW400.copyWith(
                      color: const Color(0xffF22D2D),
                    ),
                  ),
                ),
              )
          ],
        )
      ],
      children: [
        15.verticalSpace,
        if (isComingSession) ...[
          Text(
            context.tr(LocaleKeys
                .student_scheduling_student_rescheduling_reschedule_rescheduleSessionNote),
            style: AppTextStyles.font14GoldenOrangeW500,
          ),
          12.verticalSpace,
        ] else ...[
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                color: AppColors.goldenOrange.withAlpha(90),
                borderRadius: BorderRadius.circular(8.r)),
            child: Text(
              context.tr(
                LocaleKeys
                    .student_scheduling_student_rescheduling_reschedule_makeupOrExtraSessionNote,
              ),
              style: AppTextStyles.font12navyBlueW400,
            ),
          ),
          20.verticalSpace
        ],
        Text(
          context.tr(LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_formTitle),
          style: AppTextStyles.font14TextW500,
        ),
        8.verticalSpace,
        SessionCard(session: session),
        22.verticalSpace,
        Text(
          context.tr(LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_selectNote),
          style: AppTextStyles.font14GoldenOrangeW500,
        ),
        12.verticalSpace,
        if (isComingSession) ...[
          const StudentRescheduleDaysList(),
          34.verticalSpace,
        ],
        StudentRescheduleTimesList(isComingSession: isComingSession),
        const StudentRescheduleSuggestedSessions(),
        32.verticalSpace,
        Text(
          context.tr(LocaleKeys.form_field_writeANote),
          style: AppTextStyles.font14TextW500,
        ),
        8.verticalSpace,
        AppTextAreaField(textEditingController: TextEditingController()),
        10.verticalSpace,
      ],
    );
  }
}
