import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import 'menu_divider.dart';
import 'menu_header.dart';
import 'menu_section_tile.dart';

class MenuStudent extends StatelessWidget {
  const MenuStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      final bool hasActiveSchedule = state.hasActiveSchedule;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuHeader(
            firstName: state.firstName,
            secondName: state.lastName,
            imagePath: state.profileImageUrl,
          ),
          28.verticalSpace,
          const MenuDivider(),
          20.verticalSpace,
          if (hasActiveSchedule) ...[
            MenuSectionTile(
              title: LocaleKeys.mainDrawer_myProgress,
              onTap: hasActiveSchedule
                  ? () => context.router.push(const StudentMyProgressRoute())
                  : null,
            ),
            12.verticalSpace
          ],
          MenuSectionTile(
            title: LocaleKeys.mainDrawer_myRequests,
            onTap: () => context.router.push(MyRequestsRoute()),
          ),
          12.verticalSpace,
          if (hasActiveSchedule) ...[
            MenuSectionTile(
              title: LocaleKeys.mainDrawer_mySchedule,
              onTap: () => context.router.push(
                const StudentMyScheduleRoute(),
              ),
            ),
            12.verticalSpace
          ],
          MenuSectionTile(
            title: LocaleKeys.mainDrawer_subscriptions,
            onTap: () => context.router.push(const SubscriptionRoute()),
          ),
          20.verticalSpace,
          const MenuDivider(),
          20.verticalSpace,
          // const MenuSectionTile(title: LocaleKeys.mainDrawer_sanadMinhaj),
          // 12.verticalSpace,
          MenuSectionTile(
            title: LocaleKeys.mainDrawer_reciters,
            onTap: () => context.router.push(
              const ReciterListingRoute(),
            ),
          ),
          12.verticalSpace,
          MenuSectionTile(
            title: LocaleKeys.mainDrawer_programs,
            onTap: () => context.router.push(const ProgramsRoute()),
          ),
          12.verticalSpace,
          if (hasActiveSchedule &&
              getIt<AppPreferences>().getUserCachedResponse().programId ==
                  2) ...[
            MenuSectionTile(
              title: LocaleKeys.mainDrawer_skillsAndNotes,
              onTap: hasActiveSchedule
                  ? () => context.router.push(SkillsNotesRoute(
                      studentId: context.read<UserCubit>().state.id))
                  : null,
            ),
            20.verticalSpace,
          ]
        ],
      );
    });
  }
}
