import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show setEquals;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/admin_config_manager.dart';

import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_error_msg.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../home/presentation/bloc/student_progress/student_progress_cubit.dart';
import '../bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart';
import '../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import '../widgets/student_update_schedule/student_update_schedule_bloc_wrapper.dart';
import '../widgets/student_update_schedule/student_update_schedule_new_session_button.dart';
import '../widgets/student_update_schedule/student_update_schedule_sessions.dart';
import '../../domain/entites/session_time_date.dart';

@RoutePage()
class StudentUpdateSchedulePage extends StatelessWidget {
  final bool fromStudentSide;

  const StudentUpdateSchedulePage({super.key, this.fromStudentSide = true});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: StudentUpdateScheduleBlocWrapper(
        fromStudentSide: fromStudentSide,
        child: _StudentUpdateScheduleContent(fromStudentSide: fromStudentSide),
      ),
    );
  }
}

class _StudentUpdateScheduleContent extends StatefulWidget {
  final bool fromStudentSide;

  const _StudentUpdateScheduleContent({required this.fromStudentSide});

  @override
  State<_StudentUpdateScheduleContent> createState() =>
      _StudentUpdateScheduleContentState();
}

class _StudentUpdateScheduleContentState
    extends State<_StudentUpdateScheduleContent> {
  Set<String> _toPairs(List<SessionTimeDate> sessions, {bool useNew = false}) {
    return sessions.map((s) {
      final day = useNew && (s.newDayId != null || s.newTimeId != null)
          ? (s.newDayId ?? s.timeDataResponse.dayId)
          : s.timeDataResponse.dayId;
      final time = useNew && (s.newDayId != null || s.newTimeId != null)
          ? (s.newTimeId ?? s.timeDataResponse.timeId)
          : s.timeDataResponse.timeId;
      return "$day-$time";
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentMyRecurringSessionsCubit,
        StudentMyRecurringSessionsState>(
      builder: (context, state) {
        final studentRescheduleSessionsCubit =
            context.read<StudentRescheduleSessionsCubit>();

        final studentMyRecurringSessionsCubit =
            context.read<StudentMyRecurringSessionsCubit>();

        late int receiverId;
        if (widget.fromStudentSide) {
          receiverId =
              context.read<StudentMyScheduleCubit>().state.reciterInfo!.id;
        } else {
          receiverId = context.read<StudentProgressCubit>().state.studentId;
        }

        // Determine if there are any changes compared to the original snapshot stored in cubit state
        final currentEffectivePairs =
            _toPairs(state.scheduledSessions, useNew: true);
        final originalPairs = _toPairs(state.originalScheduledSessions);
        final hasChanges = !setEquals(currentEffectivePairs, originalPairs);

        return AppCustomScrollView(
          appPageHeader: AppPageHeader.subtitle,
          title: LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_rescheduleSessionTitle,
          bottomChildren: [
            AppStepsButton(
              onPressed: hasChanges
                  ? () {
                      final selectedSessionsNum =
                          studentMyRecurringSessionsCubit
                              .state.scheduledSessions.length;

                      if (AdminConfigManager.isStudentSessionCountValid(
                          selectedSessionsNum)) {
                        studentRescheduleSessionsCubit
                            .rescheduleRecuuringSessions(
                          receiverId,
                          studentMyRecurringSessionsCubit
                              .state.scheduledSessions,
                        );
                      } else {
                        studentRescheduleSessionsCubit.showError(
                          AdminConfigManager.studentSessionCountErrorMsg(),
                        );
                      }
                    }
                  : null, // Disable when no changes
              icon: const SizedBox(),
              label: Text(
                context.tr(LocaleKeys.button_sendRequest),
                style: AppTextStyles.font14WhiteW500,
              ),
            )
          ],
          children: [
            15.verticalSpace,
            Text(
              context.tr(LocaleKeys
                  .student_scheduling_student_rescheduling_updateSchedule_selectNote),
              style: AppTextStyles.font14GoldenOrangeW500,
            ),
            12.verticalSpace,
            Text(
              context.tr(LocaleKeys
                  .student_scheduling_student_rescheduling_updateSchedule_formTitle),
              style: AppTextStyles.font14TextW500,
            ),
            12.verticalSpace,
            Skeletonizer(
              enabled: state.status is Loading,
              child: const StudentUpdateScheduleSessions(),
            ),
            12.verticalSpace,
            const StudentUpdateScheduleNewSessionButton(),
            20.verticalSpace,
            Text(
              context.tr(LocaleKeys.form_field_writeANote),
              style: AppTextStyles.font14TextW500,
            ),
            8.verticalSpace,
            AppTextFormField(
              maxLines: 7,
              textEditingController:
                  context.read<StudentRescheduleSessionsCubit>().note,
            ),
            10.verticalSpace,
            BlocBuilder<StudentRescheduleSessionsCubit,
                StudentRescheduleSessionsState>(
              builder: (context, state) {
                final studentRescheduleRecuuringSessionsCubit =
                    context.read<StudentRescheduleSessionsCubit>();
                return studentRescheduleRecuuringSessionsCubit
                        .errorMsg.isNotEmpty
                    ? AppErrorMsg(
                        text: studentRescheduleRecuuringSessionsCubit.errorMsg,
                        padding: EdgeInsets.only(bottom: 20.w),
                      )
                    : const SizedBox();
              },
            ),
          ],
        );
      },
    );
  }
}
