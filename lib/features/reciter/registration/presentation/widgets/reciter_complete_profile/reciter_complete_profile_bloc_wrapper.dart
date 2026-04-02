import 'package:auto_route/auto_route.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/presentation/bloc/program_available_times/program_available_times_cubit.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart';

class ReciterCompleteProfileBlocWrapper extends StatelessWidget {
  final Widget child;
  const ReciterCompleteProfileBlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ReciterCompleteProfileCubit>(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<ProgramAvailableTimesCubit>()..getProgramAvailableTimes(),
          ),
        ],
        child: BlocListener<ReciterCompleteProfileCubit,
            ReciterCompleteProfileState>(
          listener: (context, state) {
            state.status.whenOrNull(
              loading: () => showAppLoadingDialog(context),
              failure: (error) => context.router.popForced(),
              success: () async {
                context.router.popForced();
                showAppModalBottomSheet(
                  mainBtnLabel: LocaleKeys.button_goToHomePage,
                  context: context,
                  mainOnPressed: () {
                    navigateToHomePage(context);
                    FacebookAppEvents().logViewContent();
                  },
                  subTitle: LocaleKeys.modalBottomSheet_subTitle_st2,
                  title: LocaleKeys.modalBottomSheet_title_congrats,
                  imagePath: Assets.images.sucessPopup.path,
                );
                await context.read<UserCubit>().getUserInfo();
              },
            );
          },
          child: child,
        ),
      ),
    );
  }
}
