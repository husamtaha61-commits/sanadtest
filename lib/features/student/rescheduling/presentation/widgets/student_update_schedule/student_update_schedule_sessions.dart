import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart';
import 'student_update_schedule_session_item.dart';

class StudentUpdateScheduleSessions extends StatelessWidget {
  const StudentUpdateScheduleSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentMyRecurringSessionsCubit,
        StudentMyRecurringSessionsState>(
      builder: (context, state) {
        final isLoading = state.status is Loading;

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: isLoading
              ? generateFakeTimeData(2).length
              : state.scheduledSessions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.w),
              child: SessionItem(
                index: index,
                key: ValueKey(index),
                session: isLoading
                    ? generateFakeSessionTimeData(2)[index]
                    : state.scheduledSessions[index],
              ),
            );
          },
        );
      },
    );
  }
}
