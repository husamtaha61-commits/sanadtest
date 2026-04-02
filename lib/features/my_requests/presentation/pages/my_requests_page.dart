import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/utils/after_first_layout_mixin.dart';
import '../../../../core/utils/snackbar.dart';
import '../../../../core/widgets/app_bloc_wrapper_screen.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_filter_box_properities.dart';
import '../../../../core/widgets/app_page_action_title.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../bloc/my_requests/my_requests_cubit.dart';
import '../widgets/my_requests_bloc_wrapper.dart';
import '../widgets/my_requests_filter_drawer.dart';
import '../widgets/my_requests_requests_list.dart';
import '../widgets/my_requests_requests_list_item.dart';

@RoutePage()
class MyRequestsPage extends StatefulWidget {
  const MyRequestsPage({super.key, this.initialRequestId});
  final int? initialRequestId;

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> with AfterFirstLayoutMixin {
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final myRequestsCubit = context.read<MyRequestsCubit>();
    if(widget.initialRequestId != null) {
      final myRequest = await myRequestsCubit.getRequestById(widget.initialRequestId!);
      myRequest.maybeWhen(
        success: (request) {
          showMyRequestSheetActions(context, request);
        },
        failure: (_) {
          showSnackBar(context, LocaleKeys.snackbar_requestInfoNotFound.tr(), SnackBarStatus.error);
        },
        orElse: () {},
      );
    }
    myRequestsCubit.getMyRequests();
  }

  @override
  Widget build(BuildContext context) {
    return const MyRequestsBlocWrapper(
      child: AppBlocWrapperScreen(
        endDrawer: MyRequestsFilterDrawer(),
        child: _MyRequestsContent(),
      ),
    );
  }
}

class _MyRequestsContent extends StatelessWidget {
  const _MyRequestsContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        return state.requestListStatus.maybeWhen(
          failure: (error) => AppErrorWidget(
            retryFunc: context.read<MyRequestsCubit>().getMyRequests,
          ),
          orElse: () {
            return RefreshIndicator(
              onRefresh: () => Future.sync(
                context.read<MyRequestsCubit>().pagingController.refresh,
              ),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: AppPageActionTitle(
                      title: LocaleKeys.myRequests_title,
                      withPadding: true,
                    ),
                  ),
                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AppFilterBoxProperties(
                            iconSize: 20,
                            showBorder: false,
                            iconColor: AppColors.goldenOrange,
                          ),
                          10.horizontalSpace
                        ],
                      ),
                    ),
                  ),
                  const MyRequestsRequestsList()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
