import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/utils.dart';
import '../../../auth/presentation/bloc/auth/auth_cubit.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../../core/routes/app_router.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../widgets/menu/menu_divider.dart';
import '../widgets/menu/menu_reciter.dart';
import '../widgets/menu/menu_section_tile.dart';
import '../widgets/menu/menu_student.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 28.w),
            child:  isStudentRole(context) ? const MenuStudent() : const MenuReciter(),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.only(bottom: 40.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MenuDivider(),
                16.verticalSpace,
                MenuSectionTile(
                  title: LocaleKeys.mainDrawer_accountSettings,
                  icon: SvgPicture.asset(
                    Assets.icons.settings.path,
                    width: 20.w,
                    height: 20.w,
                  ),
                  onTap: () => context.router.push(
                    const AccountSettingsRoute(),
                  ),
                ),
                12.verticalSpace,
                MenuSectionTile(
                  title: LocaleKeys.mainDrawer_helpAndSupport,
                  icon: SvgPicture.asset(
                    Assets.icons.helpSupport.path,
                    width: 20.w,
                    height: 20.w,
                  ),
                  onTap: () => context.router.push(
                    FullRoute(
                      url: "https://sanadquran-help.freshdesk.com/support/tickets/new",
                      onLoadStop: (InAppWebViewController? controller,
                          WebUri? url) async {
                        String jsCode =
                            """document.getElementById('helpdesk_ticket_email').value = "${context.read<UserCubit>().state.email}"; """;
                        await controller?.evaluateJavascript(source: jsCode);
                      },
                    ),
                  ),
                ),
                12.verticalSpace,
                MenuSectionTile(
                  title: LocaleKeys.mainDrawer_logout,
                  icon: Icon(
                    Icons.logout,
                    size: 20.w,
                  ),
                  onTap: () {
                    context.read<AuthCubit>().signout(
                          context: context,
                          isRebuild: true,
                        );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
