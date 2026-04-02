import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/di/injection.dart';

import '../../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../../core/widgets/app_error_widget.dart';
import '../../../../../core/widgets/app_page_action_title.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../bloc/reciter_listing/reciter_listing_cubit.dart';
import '../widgets/reciter_filter_drawer.dart';
import '../widgets/reciter_listing/reciter_listing_filters_options.dart';
import '../widgets/reciter_listing/reciter_listing_reciters_list.dart';
import '../widgets/reciter_listing/reciter_listing_subtitle.dart';

@RoutePage()
class ReciterListingPage extends StatelessWidget {
  const ReciterListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserInfo();

    return BlocProvider(
      create: (context) => getIt<ReciterListingCubit>()..getRecitersByPage(),
      child: const AppBlocWrapperScreen(
        endDrawer: ReciterFilterDrawer(),
        child: _ReciterListingContent(),
      ),
    );
  }
}

class _ReciterListingContent extends StatefulWidget {
  const _ReciterListingContent();

  @override
  State<_ReciterListingContent> createState() => _ReciterListingContentState();
}

class _ReciterListingContentState extends State<_ReciterListingContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterListingCubit, ReciterListingState>(
      builder: (context, state) => state.status.maybeWhen(
        failure: (error) => AppErrorWidget(
          retryFunc: context.read<ReciterListingCubit>().getRecitersByPage,
        ),
        orElse: () {
          return RefreshIndicator(
            onRefresh: () => Future.sync(
              context.read<ReciterListingCubit>().pagingController.refresh,
            ),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: AppPageActionTitle(
                    title: LocaleKeys.student_scheduling_reciterListing_title,
                    withPadding: true,
                  ),
                ),
                SliverPadding(
                  padding: AppPadding.customScrollView,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        33.verticalSpace,
                        const ReciterListingSubTitle(),
                        23.verticalSpace,
                        const ReciterListingFiltersOptions(),
                        16.verticalSpace,
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: AppPadding.customScrollView,
                  sliver: const ReciterListingRecitersList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
