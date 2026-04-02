import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../../../../../core/utils/admin_config_manager.dart';
import '../../../../../../core/utils/after_first_layout_mixin.dart';
import '../../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../bloc/student_schedule_session/student_schedule_session_cubit.dart';

import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/widgets/avaliable_times/available_times_grid.dart';
import '../../../../../shared/presentation/widgets/avaliable_times/available_times_slot.dart';
import '../../../../../shared/presentation/widgets/avaliable_times/avaliable_times_grid_title.dart';

class ReciterDetailsAvailableTimes extends StatelessWidget {
  final bool isLiveSession;
  const ReciterDetailsAvailableTimes({super.key, required this.isLiveSession});

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(isLiveSession),
          12.verticalSpace,
          _Note1(isLiveSession),
          4.verticalSpace,
          const Note2(),
          18.verticalSpace,
          _AvailableTimes(isLiveSession: isLiveSession),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final bool isLiveSession;

  const _Title(this.isLiveSession);

  @override
  Widget build(BuildContext context) {
    return Text(
      isLiveSession
          ? context.tr(LocaleKeys
              .student_scheduling_reciterDetails_availableTimes_titleLiveSession)
          : context.tr(LocaleKeys
              .student_scheduling_reciterDetails_availableTimes_title),
      style: AppTextStyles.font20TextW700,
    );
  }
}

class _Note1 extends StatelessWidget {
  final bool isLiveSession;
  const _Note1(this.isLiveSession);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: isLiveSession
            ? context.tr(LocaleKeys
                .student_scheduling_reciterDetails_availableTimes_noteStmLiveSession)
            : context.tr(
                LocaleKeys
                    .student_scheduling_reciterDetails_availableTimes_noteStm,
              ),
        style: AppTextStyles.font15TextW400,
      ),
    );
  }
}

class Note2 extends StatelessWidget {
  const Note2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(
          LocaleKeys.student_scheduling_reciterDetails_availableTimes_noteStm2),
      style: AppTextStyles.font12TextW400OP6,
    );
  }
}

class _AvailableTimes extends StatefulWidget {
  final bool isLiveSession;
  const _AvailableTimes({required this.isLiveSession});

  @override
  State<_AvailableTimes> createState() => _AvailableTimesState();
}

class _AvailableTimesState extends State<_AvailableTimes>
    with AfterFirstLayoutMixin {
  String? sessionErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AvailableTimesGridTitle(
            title: LocaleKeys
                .student_scheduling_reciterDetails_availableTimes_rectierAvailableTimes),
        BlocBuilder<ReciterAvailableTimesCubit, ReciterAvailableTimesState>(
          builder: (context, state) {
            final reciterAvailableTimesIsLoading = state.status is Loading;
            return Skeletonizer(
              enabled: reciterAvailableTimesIsLoading,
              child: _AvailableTimesGridContainer(
                isLiveSession: widget.isLiveSession,
                reciterAvailableTimes: reciterAvailableTimesIsLoading
                    ? availableTimesOptionsFakeData
                    : state.reciterAvailableTimes,
              ),
            );
          },
        ),
        if (sessionErrorMessage != null && !widget.isLiveSession)
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: Text(
              sessionErrorMessage!,
              style: TextStyle(color: AppColors.navyBlue, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (mounted && !widget.isLiveSession) {
      setState(() {
        sessionErrorMessage = AdminConfigManager.studentSessionCountErrorMsg();
      });
    }
  }
}

class _AvailableTimesGridContainer extends StatelessWidget {
  final List<AvailableTimesOptions> reciterAvailableTimes;
  final bool isLiveSession;

  const _AvailableTimesGridContainer({
    required this.reciterAvailableTimes,
    required this.isLiveSession,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        ...reciterAvailableTimes.asMap().entries.map(
          (entry) {
            int index = entry.key;
            AvailableTimesOptions item = entry.value;
            bool isLastItem = index == reciterAvailableTimes.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: isLastItem ? 0 : 30.w),
              child: _AvailableTimesGrid(
                  availableTimes: item, isLiveSession: isLiveSession),
            );
          },
        ),
      ],
    );
  }
}

class _AvailableTimesGrid extends StatelessWidget {
  final AvailableTimesOptions availableTimes;
  final bool isLiveSession;
  const _AvailableTimesGrid(
      {required this.availableTimes, required this.isLiveSession});

  @override
  Widget build(BuildContext context) {
    final studentScheduleSessionCubit =
        BlocProvider.of<StudentScheduleSessionCubit>(context);
    final userState = BlocProvider.of<UserCubit>(context).state;

    return AvailableTimesGrid(
      dayName: availableTimes.times[0].userDayName,
      itemCount: availableTimes.times.length,
      itemBuilder: (context, index) {
        return BlocBuilder<StudentScheduleSessionCubit,
            StudentScheduleSessionState>(
          builder: (context, state) {
            final bool isSelected = isLiveSession
                ? studentScheduleSessionCubit.pickedDateForOneTime ==
                        availableTimes.times[index].userTimeValue &&
                    studentScheduleSessionCubit.pickedDayIdForOneTime ==
                        availableTimes.times[index].dayId
                : studentScheduleSessionCubit.selectedWeeklyScheduleTimes
                    .where((element) =>
                        element.dayId == availableTimes.times[index].dayId &&
                        element.timeId == availableTimes.times[index].timeId)
                    .isNotEmpty;
 
            final bool isDisabled = availableTimes.times[index].isReserved;
            return GestureDetector(
              onTap: (isDisabled || userState.hasActiveSchedule)
                  ? null
                  : isLiveSession // picked time for live session
                      ? () => studentScheduleSessionCubit.pickOneTime(
                            availableTimes.times[index].userTimeValue,
                            availableTimes.times[index].dayId,
                            availableTimes.times[index].dateTime,
                          )
                      : () => studentScheduleSessionCubit.pickTime(
                            availableTimes.times[index].dayId,
                            availableTimes.times[index].timeId,
                          ),
              child: AvailableTimesSlot(
                isSelected: isSelected,
                isDisabled: isDisabled,
                timeValue: availableTimes.times[index].userTimeValue,
              ),
            );
          },
        );
      },
    );
  }
}
