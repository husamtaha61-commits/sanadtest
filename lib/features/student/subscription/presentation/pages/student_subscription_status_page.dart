import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../../core/widgets/app_error_widget.dart';
import '../../../../../../core/widgets/app_page_action_title.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../bloc/subscription/subscription_cubit.dart';
import '../widgets/student_supscription_card_widget.dart';

@RoutePage()
class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionCubit>(
      create: (_) => getIt<SubscriptionCubit>()..loadSubscriptions(),
      child: const AppBlocWrapperScreen(
        child: _SubscriptionContent(),
      ),
    );
  }
}

class _SubscriptionContent extends StatelessWidget {
  const _SubscriptionContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        return state.status.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          failure: (error) => AppErrorWidget(
            retryFunc: () =>
                context.read<SubscriptionCubit>().loadSubscriptions(),
          ),
          orElse: () {
            final subscriptions = state.subscriptions;

            if (subscriptions.isEmpty) {
              return const Center(child: Text("No subscriptions found"));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<SubscriptionCubit>().loadSubscriptions();
              },
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: AppPageActionTitle(
                      title: LocaleKeys.mainDrawer_mySubscription,
                      withPadding: true,
                    ),
                  ),
                  SliverList.separated(
                    itemCount: subscriptions.length,
                    separatorBuilder: (_, __) => 12.verticalSpace,
                    itemBuilder: (context, index) {
                      final subscription = subscriptions[index];
                      return SubscriptionCard(subscription: subscription);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
