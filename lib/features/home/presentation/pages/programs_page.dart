import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_page_action_title.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../widgets/home_our_programs.dart';

@RoutePage()
class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBlocWrapperScreen(
      child: SingleChildScrollView(
        child: _ProgramsContent(),
      ),
    );
  }
}

class _ProgramsContent extends StatelessWidget {
  const _ProgramsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppPageActionTitle(
          title: LocaleKeys.home_ourPrograms_title,
          withPadding: true,
        ),
        15.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            context.tr(LocaleKeys.home_ourPrograms_description),
            textAlign: TextAlign.center,
            style: AppTextStyles.font12TextW400,
          ),
        ),
        20.verticalSpace,
        const HomeOurPrograms(),
      ],
    );
  }
}
