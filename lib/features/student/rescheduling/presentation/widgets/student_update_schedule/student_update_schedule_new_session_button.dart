import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/extenstions/string.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/utils/app_date.dart';
import '../../../../../../core/widgets/form_fields/app_single_menu.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../../../scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../../domain/entites/session_time_date.dart';
import '../../bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart';

class StudentUpdateScheduleNewSessionButton extends StatefulWidget {
  const StudentUpdateScheduleNewSessionButton({super.key});

  @override
  State<StudentUpdateScheduleNewSessionButton> createState() =>
      _StudentUpdateScheduleNewSessionButtonState();
}

class _StudentUpdateScheduleNewSessionButtonState
    extends State<StudentUpdateScheduleNewSessionButton> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isExpand) ...[
          _SessionUpdateBox(
              setExpand: (bool value) => setState(() => isExpand = value)),
          20.verticalSpace
        ],
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: SizedBox(
            height: 30.w,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size.fromWidth(double.infinity),
              ),
              onPressed: () {
                setState(() => isExpand = true);
              },
              label: Text(
                context.tr(LocaleKeys.button_newSession),
                style: AppTextStyles.font15WhiteW400,
              ),
              icon: SvgPicture.asset(
                Assets.icons.add.path,
                width: 12.w,
                height: 12.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SessionUpdateBox extends StatefulWidget {
  final void Function(bool) setExpand;
  const _SessionUpdateBox({required this.setExpand});

  @override
  State<_SessionUpdateBox> createState() => _SessionUpdateBoxState();
}

class _SessionUpdateBoxState extends State<_SessionUpdateBox> {
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

  List<BaseField> getAvailableTimesForDay(
      List<AvailableTimesOptions> reciterAvailableTimes, int selectedDayId) {
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
        vertical: 12.w,
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
                context.tr(LocaleKeys
                    .student_scheduling_student_rescheduling_updateSchedule_new),
                style: AppTextStyles.font14TextW500,
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
                      onPressed: () {
                        resetDayTime();
                        widget.setExpand(false);
                      },
                      icon: SvgPicture.asset(Assets.icons.delete.path),
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    width: 33.w,
                    height: 33.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5ECF2),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: IconButton(
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
                          studentUpdateScheduleCubit.addNewSession(
                            SessionTimeDate(timeDataResponse: session),
                          );
                          resetDayTime();
                          widget.setExpand(false);
                        }
                      },
                      icon: SvgPicture.asset(Assets.icons.checkBlue.path),
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  selectedItem: day,
                  onItemSelected: setDay,
                  selectedItemName: day == null ? '' : day!.name,
                  fieldName: '',
                ),
                if (day != null) ...[
                  9.verticalSpace,
                  AppSingleMenu<BaseField>(
                    label: LocaleKeys.form_field_time,
                    items: getAvailableTimesForDay(
                      reciterAvailableTimesCubit.state.reciterAvailableTimes,
                      day!.id,
                    ),
                    itemAsString: (item) => item.name,
                    selectedItem: time,
                    onItemSelected: setTime,
                    selectedItemName: time == null ? '' : time!.name,
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
