import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/models/base_status.dart';
import '../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_shadow_container.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../student/scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart';
import '../../../../shared/presentation/widgets/avaliable_times/available_times_grid.dart';
import '../../../../shared/presentation/widgets/avaliable_times/available_times_slot.dart';
import '../../../../shared/presentation/widgets/avaliable_times/avaliable_times_grid_title.dart';
import '../../../../student/scheduling/presentation/bloc/reciter_details/reciter_details_cubit.dart';
import '../../../registration/domain/entities/available_times_options.dart';

class ReciterAvailableTimes extends StatelessWidget {
  const ReciterAvailableTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShadowContainer(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              context.tr(LocaleKeys
                  .student_scheduling_reciterDetails_availableTimes_title),
              style: AppTextStyles.font20TextW700,
            ),
          ),
          25.verticalSpace,
          const AvailableTimesGridTitle(
            title: LocaleKeys
                .student_scheduling_reciterDetails_availableTimes_rectierAvailableTimes,
          ),
          20.verticalSpace,
          BlocBuilder<ReciterAvailableTimesCubit, ReciterAvailableTimesState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.status is Loading,
                child: _AvaliableTimesGridContainer(
                  reciterAvailableTimes: state.status is Loading
                      ? availableTimesOptionsFakeData
                      : state.isEditingAvailability
                          ? state.programAvailableTimes
                          : state.reciterAvailableTimes,
                ),
              );
            },
          ),
          32.verticalSpace,
          const _Switch()
        ],
      ),
    );
  }
}

class _AvaliableTimesGridContainer extends StatelessWidget {
  final List<AvailableTimesOptions> reciterAvailableTimes;

  const _AvaliableTimesGridContainer({
    required this.reciterAvailableTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...reciterAvailableTimes.asMap().entries.map(
          (entry) {
            int index = entry.key;
            AvailableTimesOptions item = entry.value;
            bool isLastItem = index == reciterAvailableTimes.length - 1;

            return Padding(
              padding: EdgeInsets.only(bottom: isLastItem ? 0 : 30.w),
              child: _AvaliableTimesGrid(availableTimes: item),
            );
          },
        ),
      ],
    );
  }
}

class _AvaliableTimesGrid extends StatelessWidget {
  final AvailableTimesOptions availableTimes;
  const _AvaliableTimesGrid({required this.availableTimes});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReciterAvailableTimesCubit>();
    return AvailableTimesGrid(
      dayName: availableTimes.times[0].userDayName,
      itemCount: availableTimes.times.length,
      itemBuilder: (context, index) {
        final timeData = availableTimes.times[index];
        final isDisabled =
            cubit.state.isEditingAvailability ? false : timeData.isReserved;
        final isSelected = cubit.state.isEditingAvailability &&
            cubit.state.reciterSelectedTimeDataMap
                .containsKey(timeData.uniqueId);
        return GestureDetector(
          onTap: () {
            cubit.toggleReciterSelection(timeData);
          },
          child: AvailableTimesSlot(
            timeValue: timeData.userTimeValue,
            isDisabled: isDisabled,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}

class _Switch extends StatefulWidget {
  const _Switch();

  @override
  State<_Switch> createState() => _SwitchState();
}

class _SwitchState extends State<_Switch> {
  // make the switch take the new state until loading is done
  bool switchLoadingValue = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterDetailsCubit, ReciterDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              context.tr(LocaleKeys.reciter_profile_receiveStudents),
              style: AppTextStyles.font16TextW500,
            ),
            16.horizontalSpace,
            SizedBox(
              height: 27.w,
              child: FittedBox(
                child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.navyBlue,
                  value: state.actionStatus is Loading
                      ? switchLoadingValue
                      : state.reciter?.isReceivingNewStudents ?? false,
                  onChanged: (bool value) {
                    switchLoadingValue = value;
                    if (value) {
                      context
                          .read<ReciterDetailsCubit>()
                          .setIsReceivingNewStudents(value);
                      return;
                    }
                    showAppModalBottomSheet(
                      context: context,
                      title: LocaleKeys.modalBottomSheet_title_newStudents,
                      subTitle: LocaleKeys.modalBottomSheet_subTitle_st7,
                      mainBtnLabel: LocaleKeys.button_yes,
                      mainOnPressed: () {
                        context
                            .read<ReciterDetailsCubit>()
                            .setIsReceivingNewStudents(value);
                        context.router.maybePop();
                      },
                      secBtnLabel: LocaleKeys.button_cancel,
                      secOnPressed: context.router.maybePop,
                      isDismissible: true,
                      imagePath: Assets.images.questionPopup.path,
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
