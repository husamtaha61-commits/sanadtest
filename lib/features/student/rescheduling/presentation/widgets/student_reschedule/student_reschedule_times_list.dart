import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import 'student_reschedule_slot_item.dart';
import 'student_reschedule_slot_list.dart';

class StudentRescheduleTimesList extends StatelessWidget {
  final bool isComingSession;
  const StudentRescheduleTimesList({super.key, required this.isComingSession});

  @override
  Widget build(BuildContext context) {
    final studentRescheduleSessionsCubit =
        context.read<StudentRescheduleSessionsCubit>();

    return BlocBuilder<StudentRescheduleSessionsCubit,
        StudentRescheduleSessionsState>(
      builder: (context, studentRescheduleSessionsState) {
        bool isSelectedDay = studentRescheduleSessionsState.selectedDay != null;
        if (!isComingSession || isSelectedDay) {
          return BlocBuilder<ReciterAvailableTimesCubit,
              ReciterAvailableTimesState>(
            builder: (context, state) {
              final isLoading = state.status is! Success;
              final fakeTimes = generateFakeTimeData(7);
              List<TimeData> times = [];

              if (isSelectedDay) {
                times = state.reciterAvailableTimes
                    .firstWhere((item) =>
                        item.userDayId ==
                        studentRescheduleSessionsState.selectedDay)
                    .times;
                // Exclude selected times && Reserved times
                times = times
                    .where(
                      (time) =>
                          time.isReserved == false &&
                          !studentRescheduleSessionsState.suggestedSessions
                              .any((s) => s.dateTime == time.dateTime),
                    )
                    .toList();
              } else {
                times = [
                  ...state.reciterAvailableTimes
                      .map((day) => day.times)
                      .expand((x) => x)
                      .where(
                        (time) =>
                            time.isReserved == false &&
                            !studentRescheduleSessionsState.suggestedSessions
                                .any((s) => s.dateTime == time.dateTime),
                      ),
                ];
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (times.isNotEmpty) ...[
                    Text(
                      context.tr(LocaleKeys
                          .student_scheduling_student_rescheduling_reschedule_chooseTime),
                      style: AppTextStyles.font14TextW500,
                    ),
                    20.verticalSpace,
                    StudentRescheduleSlotList(
                      isLoading: isLoading,
                      itemCount: isLoading ? fakeTimes.length : times.length,
                      itemBuilder: (context, index) {
                        bool isSelectedTime = times[index].dateTime ==
                            studentRescheduleSessionsState.selectedTime;

                        return StudentRescheduleSlotItem(
                          isSelected: isSelectedTime,
                          text: isLoading ? "" : times[index].userTimeValue,
                          onTap: () => studentRescheduleSessionsCubit
                              .selectTime(times[index].dateTime!),
                        );
                      },
                    )
                  ],
                  if (times.isEmpty)
                    Text(context.tr(LocaleKeys
                        .form_error_availableTimes_noAvailableTimeSlots)),
                  20.verticalSpace,
                  if (studentRescheduleSessionsState.selectedDay != null &&
                          studentRescheduleSessionsState.selectedTime != null ||
                      !isComingSession &&
                          studentRescheduleSessionsState.selectedTime != null)
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: AppElevatedButton(
                        onPressed: studentRescheduleSessionsState
                                    .suggestedSessions.length ==
                                3
                            ? null
                            : () => studentRescheduleSessionsCubit
                                    .addSuggestedSession(
                                  times.firstWhere(
                                    (item) =>
                                        item.dateTime! ==
                                        studentRescheduleSessionsState
                                            .selectedTime,
                                  ),
                                ),
                        fixedSize: Size(double.infinity, 30.w),
                        child: Text(
                          context.tr(LocaleKeys.button_add),
                        ),
                      ),
                    ),
                  32.verticalSpace,
                ],
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
