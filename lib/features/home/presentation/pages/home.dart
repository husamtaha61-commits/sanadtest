import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/app_loading_indicator.dart';
import '../../../../gen/assets.gen.dart';
import '../../../notification/presentation/bloc/action_center/action_center_cubit.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';

import '../bloc/home_sections/home_sections_cubit.dart';
import '../bloc/my_sessions/my_sessions_cubit.dart';
import '../bloc/reciter_student/reciter_student_cubit.dart';
import '../widgets/home_action_banner.dart';
import '../widgets/home_reciter.dart';
import '../widgets/home_student.dart';
import '../widgets/home_upcoming_session_banner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserInfo();
    context.read<ActionCenterCubit>().getActionsCenterByPage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<MySessionsCubit>()..getMyUpCommingSession(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeSectionsCubit>(),
        ),
      ],
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => state.status.maybeWhen(
          loading: () => const AppLoadingIndicator(),
          orElse: () {
            // final hasActiveSchedule =
            //     context.read<UserCubit>().state.hasActiveSchedule;
            if (!isStudentRole(context)) {
              context.read<ReciterStudentCubit>().getAllReciterStudents();
            }
            return Column(
              children: [
                // if (hasActiveSchedule)
                const HomeUpcomingSessionBanner(),
                16.verticalSpace,
                const HomeActionBanner(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 150.w,
                          left: 0.w,
                          right: 0.w,
                          child: SvgPicture.asset(
                            Assets.images.homeBg.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            Assets.images.homeBg2.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            isStudentRole(context)
                                ? const HomeStudent()
                                : const HomeReciter(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
