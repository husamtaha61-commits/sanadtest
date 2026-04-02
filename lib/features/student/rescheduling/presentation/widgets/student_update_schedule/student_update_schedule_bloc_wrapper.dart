import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../home/presentation/bloc/student_progress/student_progress_cubit.dart';
import '../../../../scheduling/data/models/requests/reciter_available_times_for_limit_specification_request.dart';
import '../../../../scheduling/data/models/requests/reciter_available_times_specification_request.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart';
import '../../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';

class StudentUpdateScheduleBlocWrapper extends StatelessWidget {
  final Widget child;
  final bool fromStudentSide;
  const StudentUpdateScheduleBlocWrapper(
      {super.key, required this.child, required this.fromStudentSide});

  @override
  Widget build(BuildContext context) {
    final reciterId =
        context.read<StudentMyScheduleCubit>().state.reciterInfo!.id;
    int? studentId;
    if (!fromStudentSide) {
      studentId = context.read<StudentProgressCubit>().state.studentId;
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<StudentMyRecurringSessionsCubit>()
            ..getScheduleTimes(studentId),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<StudentRescheduleSessionsCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<ReciterAvailableTimesCubit>()
            ..getReciterAvailableTimes(
              ReciterAvailableTimesSpecificationRequest(reciterId: reciterId),
            ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<ReciterAvailableTimesCubit>()
            ..getReciterAvailableTimesForLimit(
              ReciterAvailableTimesForLimitSpecificationRequest(
                reciterId: reciterId,
                limitByDays: 7,
                includeQuarters: false,
              ),
            ),
          lazy: false,
        ),
      ],
      child: BlocListener<StudentRescheduleSessionsCubit,
          StudentRescheduleSessionsState>(
        listener: (context, state) {
          state.status.whenOrNull(
            loading: () => showAppLoadingDialog(context),
            failure: (error) => context.router.maybePop(),
            success: () {
              context.router.popForced();
              showAppModalBottomSheet(
                mainBtnLabel: LocaleKeys.button_continue,
                context: context,
                mainOnPressed: () {
                  context.router.popForced(); // For bottom sheet
                  context.router.popForced();
                },
                subTitle: LocaleKeys.modalBottomSheet_subTitle_st6,
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
