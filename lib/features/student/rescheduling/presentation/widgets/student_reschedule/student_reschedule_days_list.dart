import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import 'student_reschedule_slot_item.dart';
import 'student_reschedule_slot_list.dart';

class StudentRescheduleDaysList extends StatelessWidget {
  const StudentRescheduleDaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys
              .student_scheduling_student_rescheduling_reschedule_chooseDay),
          style: AppTextStyles.font14TextW500,
        ),
        18.verticalSpace,
        BlocBuilder<ReciterAvailableTimesCubit, ReciterAvailableTimesState>(
          builder: (context, state) {
            final isLoading = state.status is! Success;
            final fakeDays = generateFakeTimeData(7);

            return BlocBuilder<StudentRescheduleSessionsCubit,
                StudentRescheduleSessionsState>(
              builder: (context, studentRescheduleRecuuringSessionsState) {
                return StudentRescheduleSlotList(
                  isLoading: isLoading,
                  itemCount: isLoading
                      ? fakeDays.length
                      : state.reciterAvailableTimes.length,
                  itemBuilder: (context, index) {
                    bool isSelectedDay = false;
                    if (state.status is Success) {
                      isSelectedDay = studentRescheduleRecuuringSessionsState
                              .selectedDay ==
                          state.reciterAvailableTimes[index].times[0].userDayId;
                    }
                    return StudentRescheduleSlotItem(
                      isSelected: isSelectedDay,
                      text: isLoading
                          ? ""
                          : state.reciterAvailableTimes[index].times[0]
                              .userDayName,
                      onTap: () => context
                          .read<StudentRescheduleSessionsCubit>()
                          .selectDay(
                            state.reciterAvailableTimes[index].times[0]
                                .userDayId,
                          ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
