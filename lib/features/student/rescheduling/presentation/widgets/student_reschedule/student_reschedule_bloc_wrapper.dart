import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../scheduling/data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';

class StudentRescheduleBlocWrapper extends StatelessWidget {
  final Widget child;
  final bool isComingSession;
  final void Function()? success;
  const StudentRescheduleBlocWrapper(
      {super.key,
      required this.child,
      required this.isComingSession,
      this.success});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ReciterAvailableTimesCubit>()
            ..getReciterAvailableTimesForLimit(
              ReciterAvailableTimesForLimitSpecificationRequest(
                includeQuarters: true,
                limitByDays: isComingSession ? 7 : 1,
                reciterId: context
                        .read<StudentMyScheduleCubit>()
                        .state
                        .reciterInfo
                        ?.id ??
                    -1,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<StudentRescheduleSessionsCubit>(),
          lazy: false,
        ),
      ],
      child: BlocListener<StudentRescheduleSessionsCubit,
          StudentRescheduleSessionsState>(
        listener: (context, state) async {
          final studentRescheduleSessionsCubit =
              context.read<StudentRescheduleSessionsCubit>();

          await state.status.whenOrNull(
            loading: () async => await showAppLoadingDialog(context),
            failure: (error) {
              context.router.popForced();
            },
            success: () async {
              context.router.popForced(); // pop-up
              if (studentRescheduleSessionsCubit.cancledSessionId != null) {
                context.read<StudentMyScheduleCubit>().updateSessions(
                    studentRescheduleSessionsCubit.cancledSessionId!);
                studentRescheduleSessionsCubit.cancledSessionId = null;
              }
              await showAppModalBottomSheet(
                mainBtnLabel: LocaleKeys.button_continue,
                context: context,
                mainOnPressed: () {
                  context.router.popForced(); // For bottom sheet
                  context.router.popForced();
                },
                subTitle: state.event == StudentRescheduleSessionsEvent.cancel
                    ? LocaleKeys.modalBottomSheet_subTitle_st13
                    : state.event ==
                            StudentRescheduleSessionsEvent.addExtraSession
                        ? LocaleKeys.modalBottomSheet_subTitle_st16
                        : LocaleKeys.modalBottomSheet_subTitle_st6,
                title: LocaleKeys.modalBottomSheet_title_alright,
                imagePath: Assets.images.sucessPopup.path,
              );
            },
          );
        },
        child: child,
      ),
    );
  }
}
