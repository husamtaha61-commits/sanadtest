import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/services/analytics_service.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/snackbar.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../session_details/presentation/bloc/session_details/session_details_cubit.dart';
import '../../../../student/rescheduling/domain/entites/session.dart';
import '../../../../student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart';
import '../../../domain/entites/action_center.dart';
import '../../bloc/action_center/action_center_cubit.dart';
import '../skeletons/action_center_list_skeleton.dart';

enum ActionCenterType {
  Reschedule,
  Schedule,
  Makeup,
  CancelledSession,
  Unknown,
}

Future<void> navigateToScreenFromActionCenter(
    BuildContext context, ActionCenter action) async {
  final actionCenterType = ActionCenterType.values.firstWhere(
    (e) => e.name == action.actionName,
    orElse: () => ActionCenterType.Unknown,
  );

  try {
    final analytics = AnalyticsService.instance;

    switch (actionCenterType) {
      case ActionCenterType.Reschedule:
        analytics.logActionCenterItemClicked(
          actionType: 'Reschedule',
          actionId: action.id.toString(),
        );
        await context.router.push(MyRequestsRoute(
            initialRequestId:
                int.tryParse(action.metaDataObject["RequestId"].toString())));
        break;

      case ActionCenterType.Schedule:
        analytics.logActionCenterItemClicked(
          actionType: 'Schedule',
          actionId: action.id.toString(),
        );
        await context.router.push(MyRequestsRoute(
            initialRequestId:
                int.tryParse(action.metaDataObject["RequestId"].toString())));
        break;

      case ActionCenterType.Makeup:
        analytics.logActionCenterItemClicked(
          actionType: 'Makeup',
          actionId: action.id.toString(),
        );
        showAppLoadingDialog(context);
        final detailsResult = await getIt<SessionDetailsCubit>()
            .getSessionDetails(action.metaDataObject["SessionId"].toString());
        await context.read<StudentMyScheduleCubit>().getMySchedule();
        await context.router.maybePop();
        if (detailsResult != null) {
          await context.router.push(StudentRescheduleSessionRoute(
            session: Session.fromDetails(detailsResult),
            isComingSession: false,
          ));
        }
        break;

      case ActionCenterType.CancelledSession:
        analytics.logActionCenterItemClicked(
          actionType: 'CancelledSession',
          actionId: action.id.toString(),
        );
        showAppLoadingDialog(context);
        final detailsResult = await getIt<SessionDetailsCubit>()
            .getSessionDetails(action.metaDataObject["RequestId"].toString());
        await context.read<StudentMyScheduleCubit>().getMySchedule();
        await context.router.maybePop();
        if (detailsResult != null) {
          await context.router.push(StudentRescheduleSessionRoute(
            session: Session.fromDetails(detailsResult),
            isComingSession: false,
          ));
        }
        break;

      default:
        break;
    }

    context.read<ActionCenterCubit>().getActionsCenterByPage();
  } catch (err) {
    showGeneralSnackBarError();
  }
}

class ActionCenterSection extends StatefulWidget {
  const ActionCenterSection({super.key});

  @override
  State<ActionCenterSection> createState() => _ActionCenterSectionState();
}

class _ActionCenterSectionState extends State<ActionCenterSection> {
  late ActionCenterCubit actionCenterCubit;
  late void Function(int) _pageRequestListener;

  @override
  void initState() {
    super.initState();
    actionCenterCubit = context.read<ActionCenterCubit>();
    _pageRequestListener = (pageKey) {
      if (pageKey == 1) {
        return;
      }
      actionCenterCubit.getActionsCenterByPage(pageKey: pageKey);
    };
    actionCenterCubit.pagingController
        .addPageRequestListener(_pageRequestListener);
  }

  @override
  void dispose() {
    actionCenterCubit.pagingController
        .removePageRequestListener(_pageRequestListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionCenterCubit, ActionCenterState>(
      builder: (context, state) => state.status.maybeWhen(
        orElse: () => const SliverToBoxAdapter(child: SizedBox()),
        loading: () =>
            const SliverToBoxAdapter(child: ActionCenterListSkeleton()),
        success: () => PagedSliverList<int, ActionCenter>(
          pagingController: actionCenterCubit.pagingController,
          builderDelegate: PagedChildBuilderDelegate<ActionCenter>(
            noItemsFoundIndicatorBuilder: (context) {
              return const SizedBox();
            },
            itemBuilder: (context, item, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.w, left: 10.w, right: 10.w),
                child: ActionCenterItem(action: item),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ActionCenterItem extends StatelessWidget {
  final ActionCenter action;
  const ActionCenterItem({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToScreenFromActionCenter(context, action),
      child: Container(
        color: const Color(0xffF8F9FA),
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
          top: 14.w,
          bottom: 14.w,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.navyBlue,
                borderRadius: BorderRadius.circular((32 / 2).w),
              ),
              width: 32.w,
              height: 32.w,
              child: Center(
                child: SvgPicture.asset(
                  Assets.icons.exclamationMark.path,
                  width: 16.w,
                  height: 16.w,
                ),
              ),
            ),
            12.horizontalSpace,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(action.title, style: AppTextStyles.font14TextW500),
                  Text(
                    action.message,
                    style: AppTextStyles.font10TextW400OP6,
                  ),
                ],
              ),
            ),
            26.horizontalSpace,
            Text(
              timeago.format(action.creationDate, locale: 'custom'),
              style: AppTextStyles.font12TextW400OP6,
            ),
          ],
        ),
      ),
    );
  }
}
