import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import 'student_reschedule_suggested_sessions_item.dart';

class StudentRescheduleSuggestedSessions extends StatelessWidget {
  const StudentRescheduleSuggestedSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentRescheduleSessionsCubit,
        StudentRescheduleSessionsState>(
      builder: (context, state) {
        return Column(
          children: state.suggestedSessions
              .asMap()
              .map(
                (index, time) => MapEntry(
                  index,
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.w),
                    child: StudentRescheduleSuggestedSessionsItem(
                      index: index,
                      time: time,
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        );
      },
    );
  }
}
