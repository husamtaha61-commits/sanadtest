import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/skeletons/fake_data/available_times_options_response_fake_data.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/widgets/app_error_msg.dart';
import '../../../../../../core/widgets/app_error_widget.dart';
import '../../../../../shared/presentation/widgets/avaliable_times/available_times_grid.dart';
import '../../../../../shared/presentation/widgets/avaliable_times/available_times_slot.dart';
import '../../../domain/entities/available_times_options.dart';
import '../../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';

import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/steps/app_steps_form_text.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/program_available_times/program_available_times_cubit.dart';

class ReciterCompleteProfileAvailableTimes extends StatelessWidget {
  const ReciterCompleteProfileAvailableTimes({super.key});

  @override
  Widget build(BuildContext context) {
    final programAvailableTimesCubit =
        context.read<ProgramAvailableTimesCubit>();
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return BlocBuilder<ReciterCompleteProfileCubit, ReciterCompleteProfileState>(
      builder: (context, reciterCompleteProfileState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_availableTimes_title,
            ),
            20.verticalSpace,
            const AppStepsFormText(
              text: LocaleKeys.reciter_completeProfile_availableTimes_st1,
              isSubTitle: true,
            ),
            24.verticalSpace,
            Center(
              child: Text(
                context.tr(LocaleKeys
                    .reciter_completeProfile_availableTimes_tableCaption),
                style: AppTextStyles.font15NavyBlueW500,
              ),
            ),
            3.5.verticalSpace,
            Container(
              height: 7.w,
              color: AppColors.navyBlue,
            ),
            24.verticalSpace,
            BlocBuilder<ProgramAvailableTimesCubit, ProgramAvailableTimesState>(
              builder: (context, state) {
                final programAvailableTimesCubitIsLoading =
                    programAvailableTimesCubit.state.status is Loading;

                return state.status.maybeWhen(
                  failure: (error) => AppErrorWidget(
                    retryFunc:
                        programAvailableTimesCubit.getProgramAvailableTimes,
                  ),
                  orElse: () => Skeletonizer(
                    enabled: programAvailableTimesCubitIsLoading,
                    child: _AvalibaleTimesGrid(
                      programAvailableTimes: programAvailableTimesCubitIsLoading
                          ? availableTimesOptionsFakeData
                          : programAvailableTimesCubit
                              .state.programAvailableTimes,
                    ),
                  ),
                );
              },
            ),
            if (reciterCompleteProfileCubit
                .errorMsg['availableTimes']!.isNotEmpty)
              AppErrorMsg(
                  text: reciterCompleteProfileCubit.errorMsg['availableTimes']!)
          ],
        );
      },
    );
  }
}

class _AvalibaleTimesGrid extends StatelessWidget {
  final List<AvailableTimesOptions> programAvailableTimes;
  const _AvalibaleTimesGrid({required this.programAvailableTimes});

  @override
  Widget build(BuildContext context) {
    final reciterCompleteProfileCubit =
        context.read<ReciterCompleteProfileCubit>();

    return Column(
      children: [
        ...programAvailableTimes.asMap().map(
          (index, item) {
            bool isLastItem = index == programAvailableTimes.length - 1;
            return MapEntry(
              index,
              Padding(
                padding: EdgeInsets.only(bottom: isLastItem ? 0 : 30.w),
                child: AvailableTimesGrid(
                  dayName: item.times[0].userDayName,
                  itemCount: item.times.length,
                  itemBuilder: (context, index) {
                    final bool isSelected =
                        reciterCompleteProfileCubit.state.reciterAvailableTimes
                            .where(
                              (element) =>
                                  element.dayId == item.times[index].dayId &&
                                  element.hoursIds
                                      .contains(item.times[index].timeId),
                            )
                            .isNotEmpty;
                    return GestureDetector(
                      onTap: () {
                        reciterCompleteProfileCubit.pickTime(
                            item.times[index].dayId, item.times[index].timeId);
                      },
                      child: AvailableTimesSlot(
                        isSelected: isSelected,
                        timeValue: item.times[index].userTimeValue,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ).values,
      ],
    );
  }
}
