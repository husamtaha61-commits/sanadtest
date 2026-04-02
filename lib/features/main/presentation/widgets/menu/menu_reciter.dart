import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import 'menu_divider.dart';
import 'menu_header.dart';
import 'menu_section_tile.dart';

class MenuReciter extends StatelessWidget {
  const MenuReciter({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuHeader(
          firstName: userCubit.state.firstName,
          secondName: userCubit.state.middleName,
          imagePath: userCubit.state.profileImageUrl,
        ),
        28.verticalSpace,
        const MenuDivider(),
        16.verticalSpace,
        MenuSectionTile(
          title: LocaleKeys.mainDrawer_khitmaProgress,
          onTap: () => context.router.push(const ReciterKhitmaProgressRoute()),
        ),
        12.verticalSpace,
        MenuSectionTile(
          title: LocaleKeys.mainDrawer_myRequests,
          onTap: () => context.router.push(MyRequestsRoute()),
        ),
        20.verticalSpace,
        const MenuDivider(),
        20.verticalSpace,
        // const MenuSectionTile(title: LocaleKeys.mainDrawer_sanadMinhaj),
        // 12.verticalSpace,
        // const MenuSectionTile(title: LocaleKeys.mainDrawer_myStudents),
        // 12.verticalSpace,
      ],
    );
  }
}
