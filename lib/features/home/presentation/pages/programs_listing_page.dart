import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_custom_scroll_view.dart';
import '../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import '../../../../core/di/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/styles/app_button_style.dart';
import '../../../../core/widgets/app_shadow_container.dart';
import '../../../../core/widgets/steps/app_steps_button.dart';
import '../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../student/subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../../domain/entites/program.dart';
import '../widgets/programs_listing/programs_listing_features.dart';
import '../widgets/programs_listing/programs_listing_testimonials.dart';

@RoutePage()
class ProgramsListingPage extends StatelessWidget {
  final Program program;
  const ProgramsListingPage({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: _ProgramsListingContent(program: program),
    );
  }
}

class _ProgramsListingContent extends StatefulWidget {
  final Program program;

  const _ProgramsListingContent({required this.program});

  @override
  State<_ProgramsListingContent> createState() =>
      _ProgramsListingContentState();
}

class _ProgramsListingContentState extends State<_ProgramsListingContent> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserInfo();
  }

  int tabIndex = 0;

  final tabsLabels = [
    LocaleKeys.home_programingList_features,
    LocaleKeys.home_programingList_testimonials,
  ];

  void updateTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  bool canUserSubscribe(UserState userState) {
    final userSubscriptionStatus = userState.subscriptionStatus;
    return userSubscriptionStatus == null ||
        userSubscriptionStatus.canSubscribe;
  }

  List<Widget> getTabsWidgets(Program program) {
    return [
      ProgramsListingFeatures(program: widget.program),
      const ProgramsListingTestimonials()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return AppCustomScrollView(
        appPageHeader: AppPageHeader.title,
        title: widget.program.programType.name,
        bottomChildren: [
          AppStepsButton(
            backgroundColor: AppColors.goldenOrange,
            label: Text(context.tr(LocaleKeys.button_subscribe)),
            onPressed: canUserSubscribe(state)
                ? () => context.router.push(
                      StudentSubscriptionRoute(
                        programId: widget.program.programType.id,
                        isVideoRejection: false,
                        subscriptionCubit: getIt<SubscriptionCubit>(),
                      ),
                    )
                : null,
          ),
        ],
        children: [
          35.verticalSpace,
          Row(
            children: [
              for (var i = 0; i < tabsLabels.length; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: _TabButton(
                      index: i,
                      isSelected: tabIndex == i,
                      label: tabsLabels[i],
                      onPressed: () => updateTabIndex(i),
                    ),
                  ),
                ),
            ],
          ),
          48.verticalSpace,
          getTabsWidgets(widget.program)[tabIndex],
          18.verticalSpace,
        ],
      );
    });
  }
}

class _TabButton extends StatelessWidget {
  final bool isSelected;
  final int index;
  final String label;
  final Function() onPressed;

  const _TabButton(
      {required this.isSelected,
      required this.index,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? AppElevatedButton(
            onPressed: onPressed,
            backgroundColor: AppColors.goldenOrange,
            child: Text(context.tr(label)),
          )
        : AppShadowContainer(
            height: buttonHeight,
            padding: EdgeInsets.zero,
            child: AppElevatedButton(
              elevation: 0,
              onPressed: onPressed,
              backgroundColor: Colors.white,
              foregroundColor: AppColors.textColor,
              child: Text(context.tr(label)),
            ),
          );
  }
}
