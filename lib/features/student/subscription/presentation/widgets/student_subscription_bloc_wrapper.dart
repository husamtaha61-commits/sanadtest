import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_error_widget.dart';
import '../../../../../core/widgets/app_loading_indicator.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/get_random_quran/get_random_quran_cubit.dart';
import '../bloc/subscription/subscription_cubit.dart';

class StudentSubscriptionBlocWrapper extends StatelessWidget {
  final int programId;
  final Widget child;
  final int initialStepIndex;
  final bool isResubmit;
  final SubscriptionCubit subscriptionCubit;
  const StudentSubscriptionBlocWrapper({
    super.key,
    required this.child,
    required this.programId,
    this.initialStepIndex = 1,
    this.isResubmit = false,
    required this.subscriptionCubit,
  });

  @override
  Widget build(BuildContext context) {
    return AppBlocWrapperScreen(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetRandomQuranCubit>()..getRandomQuran(),
          ),
          BlocProvider(
            create: (context) {
              subscriptionCubit.setProgramId(programId);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                subscriptionCubit.withStateEmission(() {
                  subscriptionCubit.setActiveIndex(initialStepIndex);
                });
              });
              return subscriptionCubit;
            },
            lazy: false,
          ),
        ],
        child: BlocListener<SubscriptionCubit, SubscriptionState>(
          listenWhen: (previous, current) =>
              current.showSuccessDialog && !previous.showSuccessDialog,
          listener: (context, state) {
            context.read<SubscriptionCubit>().resetSuccessDialog();

            if (subscriptionCubit.showSuccessDialog) {
              subscriptionCubit.showSuccessDialog = false;
              showAppModalBottomSheet(
                isDismissible: false,
                mainBtnLabel: LocaleKeys.button_goToHomePage,
                context: context,
                mainOnPressed: () => navigateToHomePage(context),
                subTitle: LocaleKeys.modalBottomSheet_subTitle_st1,
                title: LocaleKeys.modalBottomSheet_title_great,
                imagePath: Assets.images.sucessPopup.path,
              ).then((_) {
                subscriptionCubit.showSuccessDialog = true;
              });
            }
          },
          child: BlocBuilder<GetRandomQuranCubit, GetRandomQuranState>(
            builder: (context, getRandomQuranState) {
              if (getRandomQuranState.status is Loading) {
                return const AppLoadingIndicator();
              } else if (getRandomQuranState.status is Failure) {
                return AppErrorWidget(
                  retryFunc: () =>
                      context.read<GetRandomQuranCubit>().getRandomQuran(),
                );
              }
              return child;
            },
          ),
        ),
      ),
    );
  }
}
