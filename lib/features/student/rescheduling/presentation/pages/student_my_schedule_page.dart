import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_error_widget.dart';
import '../../../scheduling/presentation/widgets/reciter_details/reciter_details_title.dart';
import '../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../widgets/student_my_schedule/student_my_schedule_bloc_wrapper.dart';
import '../widgets/student_my_schedule/student_my_schedule_buttons.dart';
import '../widgets/student_my_schedule/student_my_schedule_calendar.dart';
import '../widgets/student_my_schedule/student_my_schedule_reciter_details.dart';

@RoutePage()
class StudentMySchedulePage extends StatefulWidget {
  const StudentMySchedulePage({super.key});

  @override
  State<StudentMySchedulePage> createState() => _StudentMySchedulePageState();
}

class _StudentMySchedulePageState extends State<StudentMySchedulePage> {
  @override
  void initState() {
    super.initState();
    context.read<StudentMyScheduleCubit>().getMySchedule();
  }

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
        child: StudentMyScheduleBlocWrapper(
      child: _StudentMyScheduleContent(),
    ));
  }
}

class _StudentMyScheduleContent extends StatelessWidget {
  const _StudentMyScheduleContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentMyScheduleCubit, StudentMyScheduleState>(
      builder: (context, state) {
        return state.status.maybeWhen(
          failure: (error) => AppErrorWidget(
            retryFunc: context.read<StudentMyScheduleCubit>().getMySchedule,
          ),
          orElse: () {
            final studentMyScheduleState =
                context.read<StudentMyScheduleCubit>().state;

            return AppCustomScrollView(
              appPageHeader: AppPageHeader.none,
              padding: EdgeInsets.zero,
              bottomChildren: const [StudentMyScheduleButtons()],
              children: [
                Padding(
                  padding: AppPadding.pageTitlteBackBtn,
                  child: ReciterDetailsTitle(
                    reciterId: studentMyScheduleState.reciterInfo?.id,
                    videoId: studentMyScheduleState.reciterInfo?.videoId,
                    isFav: studentMyScheduleState.reciterInfo?.isFavorite,
                    status: studentMyScheduleState.status,
                  ),
                ),
                Padding(
                  padding: AppPadding.customScrollView,
                  child: Column(
                    children: [
                      10.verticalSpace,
                      Skeletonizer(
                        enabled: state.status is Loading,
                        child: const StudentMyScheduleReciterDetails(),
                      ),
                      20.verticalSpace,
                      Skeletonizer(
                        enabled: state.status is Loading,
                        child: const StudentMyScheduleCalendar(),
                      ),
                      20.verticalSpace
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
