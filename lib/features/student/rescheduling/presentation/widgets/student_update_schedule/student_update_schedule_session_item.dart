import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/extenstions/date_time.dart';
import '../../../../../../core/extenstions/string.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/utils/app_date.dart';
import '../../../../../../core/widgets/app_directionality_l_t_r.dart';
import '../../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../../domain/entites/session_time_date.dart';
import '../../bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart';

class SessionItem extends StatefulWidget {
  final SessionTimeDate session;
  final int index;
  const SessionItem({super.key, required this.session, required this.index});

  @override
  State<SessionItem> createState() => _SessionItemState();
}

class _SessionItemState extends State<SessionItem> {
  bool isExpand = false;
  BaseField? day;
  BaseField? time;

  void setDay(BaseField? value) => setState(() {
        day = value;
        time = null;
      });
  void setTime(BaseField? value) => setState(() => time = value);
  void resetDayTime() => setState(() {
        day = null;
        time = null;
      });

  @override
  Widget build(BuildContext context) {
    final studentUpdateScheduleCubit =
        context.read<StudentMyRecurringSessionsCubit>();
    final reciterAvailableTimesCubit =
        context.read<ReciterAvailableTimesCubit>();
    final sessionTime =
        widget.session.timeDataResponse.userTimeValue.toDate(AppDate.HHmm);
    final sessionTimeInhhmmaFormat =
        sessionTime!.toStr(AppDate.HHmm, localized: true);

    return Column(
      children: [
        AppShadowContainer(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(minWidth: 70.w),
                child: Text(
                  widget.session.timeDataResponse.userDayName,
                  style: AppTextStyles.font14TextW500,
                ),
              ),
              AppDirectionalityLTR(
                child: Text(
                  "$sessionTimeInhhmmaFormat - ${AppDate.getSessionEndTime(sessionTime)}",
                  style: AppTextStyles.font12TextW300,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 33.w,
                    height: 33.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffF22D2D),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => studentUpdateScheduleCubit
                          .deleteSession(widget.session),
                      icon: SvgPicture.asset(
                        Assets.icons.delete.path,
                        width: 14.w,
                        height: 14.w,
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    width: 33.w,
                    height: 33.w,
                    decoration: BoxDecoration(
                      color: isExpand
                          ? const Color(0xffE5ECF2)
                          : AppColors.navyBlue,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        isExpand
                            ? Assets.icons.checkBlue.path
                            : Assets.icons.reschedule.path,
                        width: 14.w,
                        height: 14.w,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (time != null) {
                          final AvailableTimesOptions availableTimesOptions =
                              reciterAvailableTimesCubit
                                  .state.reciterAvailableTimes
                                  .where((item) => item.userDayId == day!.id)
                                  .first;
                          final TimeData session = availableTimesOptions.times
                              .where((item) => item.timeId == time!.id)
                              .first;

                          studentUpdateScheduleCubit.updateExistingSession(
                            widget.session,
                            widget.index,
                            session.dayId,
                            time!.id,
                          );
                        }
                        setState(() => isExpand = !isExpand);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        if (isExpand) ...[
          8.verticalSpace,
          SessionUpdateBox(
            session: widget.session,
            index: widget.index,
            day: day,
            time: time,
            setDay: setDay,
            setTime: setTime,
            resetDayTime: resetDayTime,
          ),
        ]
      ],
    );
  }
}

class SessionUpdateBox extends StatefulWidget {
  final SessionTimeDate session;
  final int index;
  final BaseField? day;
  final BaseField? time;
  final void Function(BaseField?) setDay;
  final void Function(BaseField?) setTime;
  final void Function() resetDayTime;
  const SessionUpdateBox({
    super.key,
    required this.session,
    required this.index,
    this.day,
    this.time,
    required this.setDay,
    required this.setTime,
    required this.resetDayTime,
  });

  @override
  State<SessionUpdateBox> createState() => _SessionUpdateBoxState();
}

class _SessionUpdateBoxState extends State<SessionUpdateBox> {
  List<BaseField> getAvailableTimesForDay(
    List<AvailableTimesOptions> reciterAvailableTimes,
    int selectedDayId,
  ) {
    // Find the available times for the selected day
    final availableTimesForDay = reciterAvailableTimes
        .firstWhere(
          (item) => item.userDayId == selectedDayId,
        )
        .times;

    // Filter unreserved times
    final unreservedTimes =
        availableTimesForDay.where((item) => item.isReserved == false);

    // Map to BaseField
    return unreservedTimes
        .map(
          (item) => BaseField(
            id: item.timeId,
            name: item.userTimeValue.toHHMMAFormat(AppDate.HHmm),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final reciterAvailableTimesCubit =
        context.read<ReciterAvailableTimesCubit>();
    final studentUpdateScheduleCubit =
        context.read<StudentMyRecurringSessionsCubit>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 24.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppShadows.blur4BlackOP25,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.goldenOrange,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(
                  LocaleKeys
                      .student_scheduling_student_rescheduling_updateSchedule_cardTitle,
                ),
                style: AppTextStyles.font14TextW500,
              ),
              InkWell(
                onTap: () {
                  widget.resetDayTime();
                  studentUpdateScheduleCubit.resetExistingSession(
                    widget.session,
                    widget.index,
                  );
                },
                child: Text(
                  context.tr(LocaleKeys
                      .student_scheduling_student_rescheduling_updateSchedule_clear),
                  style: AppTextStyles.font14navyBlueW500.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(LocaleKeys
                      .student_scheduling_student_rescheduling_updateSchedule_prev),
                  style: AppTextStyles.font14navyBlueW500,
                ),
                10.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.textColor.withAlpha(50),
                    ),
                  ),
                  child: Text(
                    widget.session.timeDataResponse.userDayName,
                    style: AppTextStyles.font14TextW400OP8,
                  ),
                ),
                10.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.textColor.withAlpha(50),
                    ),
                  ),
                  child: Text(
                    widget.session.timeDataResponse.userTimeValue
                        .toHHMMAFormat(AppDate.HHmm),
                    style: AppTextStyles.font14TextW400OP8,
                  ),
                ),
                22.verticalSpace,
                Text(
                  context.tr(LocaleKeys
                      .student_scheduling_student_rescheduling_updateSchedule_new),
                  style: AppTextStyles.font14navyBlueW500,
                ),
                14.verticalSpace,
                AppSingleMenu<BaseField>(
                  label: LocaleKeys.form_field_day,
                  items: reciterAvailableTimesCubit.state.reciterAvailableTimes
                      .map(
                        (item) => BaseField(
                          id: item.times[0].userDayId,
                          name: item.times[0].userDayName,
                        ),
                      )
                      .toList(),
                  itemAsString: (item) => item.name,
                  selectedItem: widget.day,
                  onItemSelected: widget.setDay,
                  selectedItemName: widget.day == null ? '' : widget.day!.name,
                  fieldName: '',
                ),
                if (widget.day != null) ...[
                  9.verticalSpace,
                  AppSingleMenu<BaseField>(
                    label: LocaleKeys.form_field_time,
                    items: getAvailableTimesForDay(
                      reciterAvailableTimesCubit.state.reciterAvailableTimes,
                      widget.day!.id,
                    ),
                    itemAsString: (item) => item.name,
                    selectedItem: widget.time,
                    onItemSelected: widget.setTime,
                    selectedItemName:
                        widget.time == null ? '' : widget.time!.name,
                    fieldName: '',
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
