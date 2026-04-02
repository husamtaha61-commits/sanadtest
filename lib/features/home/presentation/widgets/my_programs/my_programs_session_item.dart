import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';

class MyProgramsSessionItem extends StatelessWidget {
  final DateTime sessionDateTime;
  final Session session;
  final int index;
  final List<Session>? sessions;
  final bool isClickable;

  const MyProgramsSessionItem({
    super.key,
    required this.sessionDateTime,
    required this.index,
    required this.session,
    this.sessions,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    final sessionStatus = SessionStatus.values[session.status.id - 1];

    final BorderSide border = sessionStatus == SessionStatus.completed
        ? BorderSide(
            color: AppColors.goldenOrange,
            width: 2.w,
          )
        : BorderSide.none;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 10.w),
          child: SizedBox(
            height: 36.w,
            width: 36.w,
            child: IgnorePointer(
              ignoring: !isClickable,
              child: AppElevatedButton(
                padding: EdgeInsets.zero,
                onPressed: _getSessionOnPressedHandler(context, sessionStatus),
                borderSide: border,
                child: Text("${index + 1}"),
              ),
            ),
          ),
        )
      ],
    );
  }

  VoidCallback? _getSessionOnPressedHandler(
      BuildContext context, SessionStatus sessionStatus) {
    if ((sessionStatus == SessionStatus.completed)) {
      return () {
        context.pushRoute(SessionDetailsRoute(
            sessionId: session.sessionId,
            sessions: sessions,
            firstSessionIndex: index));
      };
    }
    return null;
  }
}
