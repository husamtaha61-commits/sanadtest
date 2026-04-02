import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/extenstions/date_time.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/services/app_preferences.dart';
import '../../../../../../core/theme/styles/app_colors.dart';
import '../../../../../../core/theme/styles/app_shadows.dart';
import '../../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../../core/widgets/app_transform_flip_x.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/widgets/sessions/session_card.dart';
import '../../../domain/entites/session.dart';
import '../../bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';

class StudentMyScheduleCalendar extends StatelessWidget {
  const StudentMyScheduleCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final isAr = getIt<AppPreferences>().isAr;
    return Container(
      padding: EdgeInsets.only(
        top: 18.w,
        bottom: 12.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.white,
        boxShadow: AppShadows.blur4BlackOP25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Title(),
          16.verticalSpace,
          TableCalendar(
            daysOfWeekHeight: 30.w,
            rowHeight: 50.w,
            locale: getIt<AppPreferences>().getLang,
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: _buildHeaderStyle(),
            calendarBuilders: CalendarBuilders(
              outsideBuilder: (context, day, focusedDay) => DefaultCell(
                day: day,
                isOutSide: true,
              ),
              defaultBuilder: (context, day, focusedDay) {
                return _TableCalendarCell(day: day);
              },
            ),
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: isAr
                  ? AppTextStyles.font10TextW400OP7
                  : AppTextStyles.font12TextW400OP7,
              weekdayStyle: isAr
                  ? AppTextStyles.font10TextW400OP7
                  : AppTextStyles.font12TextW400OP7,
            ),
            firstDay: DateTime(2024, 1, 1),
            lastDay: DateTime(2030, 1, 1),
            focusedDay: DateTime.now(),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
          ),
          24.verticalSpace,
          const _SessionLabels(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        context.tr(LocaleKeys
            .student_scheduling_student_rescheduling_mySchedule_calendarTitle),
        style: AppTextStyles.font20TextW700,
      ),
    );
  }
}

class _ChervonIcon extends StatelessWidget {
  final String imagePath;
  const _ChervonIcon({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.navyBlue,
      ),
      child: Center(
        child: AppTransformFlipX(
          child: SvgPicture.asset(
            imagePath,
            width: 10.w,
            height: 10.w,
          ),
        ),
      ),
    );
  }
}

class _TableCalendarCell extends StatelessWidget {
  final DateTime day;

  const _TableCalendarCell({required this.day});

  @override
  Widget build(BuildContext context) {
    var sessions = context.read<StudentMyScheduleCubit>().state.sessionResponse;

    List<Session> groupSessions = [];

    for (var session in sessions) {
      if (_isSameDate(session.sessionDateTime, day)) {
        groupSessions.add(session);
      }
    }
    if (groupSessions.isNotEmpty) {
      // Sorting the sessions depends on it's time
      groupSessions.sort((a, b) {
        DateTime dateA = a.sessionDateTime;
        DateTime dateB = b.sessionDateTime;
        return dateA.compareTo(dateB);
      });
      return SessionCell(day: day, sessions: groupSessions);
    }

    return DefaultCell(day: day);
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.toLocal().toDateOnly() == date2.toLocal().toDateOnly();
  }
}

class SessionCell extends StatelessWidget {
  final DateTime day;
  final List<Session> sessions;
  const SessionCell({super.key, required this.day, required this.sessions});

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys
                          .student_scheduling_student_rescheduling_mySchedule_bottomSheet_title),
                      style: AppTextStyles.font14GoldenOrangeW500,
                    ),
                    12.verticalSpace,
                    Text(
                      context.tr(LocaleKeys
                          .student_scheduling_student_rescheduling_mySchedule_bottomSheet_subTitle),
                      style: AppTextStyles.font14TextW500,
                    ),
                    8.verticalSpace,
                    ...sessions.map(
                      (session) => Padding(
                        padding: EdgeInsets.only(bottom: 12.w),
                        child: InkWell(
                          onTap: session.status.id ==
                                  SessionStatus.completed.intValue
                              ? null
                              : () => context.router.push(
                                    StudentRescheduleSessionRoute(
                                      session: session,
                                      isComingSession: session.status.id ==
                                          SessionStatus.upcoming.intValue,
                                    ),
                                  ),
                          child: SessionCard(session: session),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (sessions.isEmpty) return;

        final session = sessions[0];

        bool isComingSession =
            session.status.id == SessionStatus.upcoming.intValue;

        bool isInCompletedSession =
            session.status.id == SessionStatus.incompleted.intValue;

        if (sessions.length == 1 && (isInCompletedSession || isComingSession)) {
          context.router.push(StudentRescheduleSessionRoute(
            session: session,
            isComingSession: isComingSession,
          ));
        } else {
          showBottomSheet(context);
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.w),
            child: Container(
              padding: EdgeInsets.only(top: 4.w, bottom: 6.w),
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: const Color(0xffF8F9FA),
              ),
              child: Column(
                children: [
                  Text(
                    day.day.toString(),
                    style: AppTextStyles.font12TextW600,
                  ),
                  const Spacer(),
                  Wrap(
                    children: sessions.map(
                      (session) {
                        return Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: Container(
                            width: 6.w,
                            height: 6.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              color:
                                  SessionTypes.fromId(session.type.id)?.color ??
                                      SessionTypes.schedule.color,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
          ),
          ...sessions.map(
            (session) {
              return (session.status.id == SessionStatus.incompleted.intValue)
                  ? Positioned(
                      right: 0,
                      child: SvgPicture.asset(
                        Assets.icons.incompleteSession.path,
                        width: 10.w,
                        height: 10.w,
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class DefaultCell extends StatelessWidget {
  final DateTime day;
  final bool isOutSide;
  const DefaultCell({super.key, required this.day, this.isOutSide = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: Container(
        padding: EdgeInsets.only(top: 4.w, bottom: 6.w),
        width: 35.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: isOutSide ? Colors.transparent : const Color(0xffF8F9FA),
        ),
        child: Center(
            child: Text(
          day.day.toString(),
          style: AppTextStyles.font12TextW600
              .copyWith(color: isOutSide ? const Color(0xFFAEAEAE) : null),
        )),
      ),
    );
  }
}

class _SessionLabels extends StatelessWidget {
  const _SessionLabels();

  @override
  Widget build(BuildContext context) {
    final sessionTypesLength =
        SessionTypes.values.where((session) => session.id != 3).length;
    return AlignedGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      crossAxisCount: 2,
      mainAxisSpacing: 5.w,
      crossAxisSpacing: 12.w,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sessionTypesLength + 1, // +1 (for incomplete label)
      itemBuilder: (context, index) {
        if (index < sessionTypesLength) {
          final sessionLabel = SessionTypes.values
              .where((session) => session.id != 3)
              .elementAt(index);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: sessionLabel.color,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Text(
                  context.tr(sessionLabel.id == 2
                      ? LocaleKeys
                          .student_scheduling_student_rescheduling_mySchedule_sessionTypes_rescheduledSession
                      : sessionLabel.uiName!),
                  style: AppTextStyles.font12TextW400,
                  softWrap: true,
                ),
              ),
            ],
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.incompleteSession.path,
                width: 6.w,
                height: 6.w,
              ),
              12.horizontalSpace,
              Expanded(
                child: Text(
                  context.tr(LocaleKeys
                      .student_scheduling_student_rescheduling_mySchedule_sessionTypes_incompleteSession),
                  style: AppTextStyles.font12TextW400,
                  softWrap: true,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

HeaderStyle _buildHeaderStyle() {
  return HeaderStyle(
    titleTextStyle: AppTextStyles.font14TextW500.copyWith(
      fontFamily: FontFamily.readexPro,
    ),
    headerMargin: EdgeInsets.only(
      left: 10.w,
      right: 10.w,
      bottom: 16.w,
    ),
    headerPadding: const EdgeInsets.all(0),
    titleCentered: true,
    formatButtonVisible: false,
    leftChevronMargin: const EdgeInsets.all(0),
    leftChevronPadding: const EdgeInsets.all(0),
    rightChevronMargin: const EdgeInsets.all(0),
    rightChevronPadding: const EdgeInsets.all(0),
    leftChevronIcon: _ChervonIcon(imagePath: Assets.icons.arrowBackAngel.path),
    rightChevronIcon: _ChervonIcon(
      imagePath: Assets.icons.arrowNextAngel.path,
    ),
  );
}
