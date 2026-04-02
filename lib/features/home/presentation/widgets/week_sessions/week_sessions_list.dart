import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';
import '../../../../student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../../student/rescheduling/presentation/bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import '../../bloc/my_sessions/my_sessions_cubit.dart';
import 'week_sessions_list_item.dart';

class WeekSessionsList extends StatelessWidget {
  final List<Session> sessions;
  const WeekSessionsList({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StudentRescheduleSessionsCubit>(),
      child: BlocListener<StudentRescheduleSessionsCubit,
          StudentRescheduleSessionsState>(
        listener: (context, state) {
          state.status.whenOrNull(
            loading: () => showAppLoadingDialog(context),
            failure: (error) {
              context.router.popForced();
              context.router.popForced();
            },
            success: () {
              final studentRescheduleSessionsCubit =
                  context.read<StudentRescheduleSessionsCubit>();
              context.router.popForced(); // pop-up
              context.router.popForced(); // bottomSheet
              context.read<MySessionsCubit>().updateWeekSessions(
                  studentRescheduleSessionsCubit.cancledSessionId!);
              context.read<StudentMyScheduleCubit>().updateSessions(
                  studentRescheduleSessionsCubit.cancledSessionId!);
              studentRescheduleSessionsCubit.cancledSessionId = null;
              showAppModalBottomSheet(
                mainBtnLabel: LocaleKeys.button_continue,
                context: context,
                mainOnPressed: () {
                  context.router.popForced();
                },
                subTitle: LocaleKeys.modalBottomSheet_subTitle_st6,
                title: LocaleKeys.modalBottomSheet_title_alright,
                imagePath: Assets.images.sucessPopup.path,
              );
            },
          );
        },
        child: Container(
          constraints: BoxConstraints(maxHeight: 300.w),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.w),
            shrinkWrap: true,
            itemCount: sessions.length,
            itemBuilder: (context, index) =>
                WeekSessionsListItem(session: sessions[index]),
          ),
        ),
      ),
    );
  }
}
