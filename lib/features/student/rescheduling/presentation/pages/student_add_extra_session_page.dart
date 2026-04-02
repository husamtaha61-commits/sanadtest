import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/widgets/form_fields/app_text_area_field.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart';
import '../widgets/student_reschedule/student_reschedule_bloc_wrapper.dart';
import '../widgets/student_reschedule/student_reschedule_times_list.dart';
import '../widgets/student_reschedule/student_reschedule_suggested_sessions.dart';

@RoutePage()
class StudentAddExtraSessionPage extends StatelessWidget {
  const StudentAddExtraSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: StudentRescheduleBlocWrapper(
        isComingSession: false,
        child: _StudentAddExtraSessionContent(),
      ),
    );
  }
}

class _StudentAddExtraSessionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentRescheduleSessionsCubit =
        context.read<StudentRescheduleSessionsCubit>();
    final reciterId =
        context.read<StudentMyScheduleCubit>().state.reciterInfo?.id;

    return BlocBuilder<StudentRescheduleSessionsCubit,
        StudentRescheduleSessionsState>(
      builder: (context, state) {
        return AppCustomScrollView(
          appPageHeader: AppPageHeader.subtitle,
          title: LocaleKeys
              .student_scheduling_student_rescheduling_mySchedule_sessionTypes_extraSession
              .tr(),
          bottomChildren: [
            Padding(
              padding: EdgeInsets.only(bottom: 40.w, left: 16.w, right: 16.w),
              child: AppElevatedButton(
                onPressed: state.suggestedSessions.isEmpty
                    ? null
                    : () {
                        studentRescheduleSessionsCubit.addExtraSession(
                          reciterId!,
                        );
                      },
                child: Text(context.tr(LocaleKeys.button_sendRequest)),
              ),
            ),
          ],
          children: [
            20.verticalSpace,
            20.verticalSpace,
            const StudentRescheduleTimesList(isComingSession: false),
            const StudentRescheduleSuggestedSessions(),
            32.verticalSpace,
            Text(
              context.tr(LocaleKeys.form_field_writeANote),
              style: AppTextStyles.font14TextW500,
            ),
            8.verticalSpace,
            AppTextAreaField(
              textEditingController: studentRescheduleSessionsCubit.note,
            ),
            10.verticalSpace,
          ],
        );
      },
    );
  }
}
