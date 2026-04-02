import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../student/rescheduling/domain/entites/session.dart';
import 'my_programs_session_item.dart';

class MyProgramsSessionList extends StatelessWidget {
  final List<Session> sessions;
  final bool isClickable;

  const MyProgramsSessionList({
    super.key,
    required this.sessions,
    this.isClickable = true,
  });

  bool isDateEqualOrLessThanOneHour(DateTime specificDate) {
    DateTime now = DateTime.now();
    final difference = now.difference(specificDate);
    if (difference.isNegative) {
      return false;
    }

    return specificDate.isAtSameMomentAs(now) ||
        (difference.inHours == 0 && difference.inMinutes <= 59);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.w,
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: EdgeInsets.only(top: 10.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          final session = sessions[index];
          final sessionDateTime = session.sessionDateTime;
          return MyProgramsSessionItem(
            sessionDateTime: sessionDateTime,
            index: index,
            session: session,
            sessions: sessions
                .where((session) =>
                    session.sessionDateTime.isBefore(DateTime.now()))
                .toList(),
            isClickable: isClickable,
          );
        },
      ),
    );
  }
}
