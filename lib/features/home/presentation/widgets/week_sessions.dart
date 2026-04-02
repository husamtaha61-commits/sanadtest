import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/base_status.dart';
import '../../../../core/widgets/app_page_title.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/my_sessions/my_sessions_cubit.dart';
import 'week_sessions/week_sessions_list.dart';

class WeekSessions extends StatefulWidget {
  const WeekSessions({super.key});

  @override
  State<WeekSessions> createState() => _WeekSessionsState();
}

class _WeekSessionsState extends State<WeekSessions> {
  @override
  void initState() {
    super.initState();
    context.read<MySessionsCubit>().getWeekSessions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySessionsCubit, MySessionsState>(
      buildWhen: (prev, cur) => prev.weekSessions != cur.weekSessions,
      builder: (context, state) {
        if (state.status is Success && state.weekSessions.isNotEmpty) {
          return Container(
            color: const Color(0xFFF8F9FA),
            padding: EdgeInsets.symmetric(
              vertical: 50.w,
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                const AppPageTitle(
                  title: LocaleKeys.home_thisWeekSessions_title,
                ),
                20.verticalSpace,
                WeekSessionsList(sessions: state.weekSessions)
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
