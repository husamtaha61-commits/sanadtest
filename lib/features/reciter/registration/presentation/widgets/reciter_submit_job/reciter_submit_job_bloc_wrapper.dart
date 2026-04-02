import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

import '../../../../../../core/di/injection.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../bloc/reciter_submit_job/reciter_submit_job_cubit.dart';

class ReciterSubmitJobBlocWrapper extends StatelessWidget {
  final Widget child;
  const ReciterSubmitJobBlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: BlocProvider(
        create: (context) => getIt<ReciterSubmitJobCubit>(),
        lazy: false,
        child: BlocListener<ReciterSubmitJobCubit, ReciterSubmitJobState>(
          listener: (context, state) {
            state.status.whenOrNull(
              initial: () {
                if (context.read<ReciterSubmitJobCubit>().removeLoading) {
                  context.read<ReciterSubmitJobCubit>().removeLoading = false;
                  context.router.popForced();
                }
              },
              loading: () => showAppLoadingDialog(context),
              failure: (error) => context.router.popForced(),
              success: () {
                context.router.popForced();
                showAppModalBottomSheet(
                  mainBtnLabel: LocaleKeys.button_goToLogin,
                  context: context,
                  mainOnPressed: () {
                    context.router.replaceAll(
                      [LoginRoute()],
                      updateExistingRoutes: false,
                    );
                  },
                  subTitle: LocaleKeys.modalBottomSheet_subTitle_st1,
                  title: LocaleKeys.modalBottomSheet_title_great,
                  imagePath: Assets.images.sucessPopup.path,
                );
              },
            );
          },
          child: child,
        ),
      ),
    );
  }
}
