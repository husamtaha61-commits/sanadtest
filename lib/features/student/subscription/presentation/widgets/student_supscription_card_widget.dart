import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/request_status_manager.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/styles/app_colors.dart';
import '../../../../../core/theme/styles/app_text_style.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/steps/app_steps_button.dart';
import '../../../../../gen/translations/locale_keys.g.dart';
import '../../../../main/presentation/widgets/menu/menu_divider.dart';
import '../../data/models/responses/get_student_subscribition_response.dart';
import '../bloc/subscription/subscription_cubit.dart';

class SubscriptionCard extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionCard({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    final status = subscription.status;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(status),
            8.verticalSpace,
            const MenuDivider(),
            4.verticalSpace,
            Text(
              "${LocaleKeys.myRequests_filters_requestId.tr()} - ${subscription.id}",
              style: const TextStyle(color: Colors.black54),
            ),
            2.verticalSpace,
            if (subscription.recitation != null)
              Text(subscription.recitation!,
                  style: AppTextStyles.font16NavyBlueW600),
            21.verticalSpace,
            Text(
              formatDate(subscription.createdAt),
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            18.verticalSpace,
            _StatusSection(status: status, subscription: subscription),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(SubscriptionStatus status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(subscription.program, style: AppTextStyles.font20TextW600),
        _StatusChip(status: status),
      ],
    );
  }
}

class _StatusSection extends StatelessWidget {
  final SubscriptionStatus status;
  final SubscriptionModel subscription;

  const _StatusSection({required this.status, required this.subscription});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case SubscriptionStatus.pending:
        return const _PendingStatus();
      case SubscriptionStatus.approved:
      case SubscriptionStatus.suspended:
        return _ApprovedStatus(subscription);
      case SubscriptionStatus.rejected:
        return _RejectedStatus(subscription: subscription);
      default:
        return const SizedBox.shrink();
    }
  }
}

class _PendingStatus extends StatelessWidget {
  const _PendingStatus();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.button_pending,
                  style: AppTextStyles.font15NavyBlueW500)
              .tr(),
          4.verticalSpace,
          Text(LocaleKeys.subscription_status_pendingStatusDescribtion,
                  style: AppTextStyles.font12TextW400)
              .tr(),
        ],
      );
}

class _ApprovedStatus extends StatelessWidget {
  const _ApprovedStatus(this.subscription);
  final SubscriptionModel subscription;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.button_approved, style: AppTextStyles.font16TextW600)
              .tr(),
          4.verticalSpace,
          Text(LocaleKeys.subscription_status_approvedStatusDescribtion,
                  style: TextStyle(color: AppColors.lighterTextColor))
              .tr(),
          50.verticalSpace,
          if (subscription.paid == false ||
              subscription.isInstallment == true &&
                  subscription.installments!.any((i) => i.paid == false))
            AppStepsButton(
              label: Text(
                LocaleKeys.subscription_status_proceedToPaymentBtn.tr(),
                style:
                    AppTextStyles.font16TextW600.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.navyBlue,
              onPressed: () {
                context.router
                    .push(PaymentPlansRoute(subscriptionModel: subscription));
              },
            ),
        ],
      );
}

class _StatusChip extends StatelessWidget {
  final SubscriptionStatus status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final textColor =
        RequestStatusManager.getRequestTextColor(status.requestStatusId);
    final bgColor =
        RequestStatusManager.getRequestBgColor(status.requestStatusId);

    return Container(
      width: 115.w,
      height: 33.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.name,
        style: AppTextStyles.font14TextW500.copyWith(color: textColor),
      ),
    );
  }
}

class _RejectedStatus extends StatelessWidget {
  final SubscriptionModel subscription;

  const _RejectedStatus({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final rejection = (subscription.rejectionReasons?.isNotEmpty ?? false)
        ? subscription.rejectionReasons!.first
        : null;

    final normalizedReason =
        (rejection?.rejectionReason ?? "").toLowerCase().trim();

    final isVideoRejection = normalizedReason.contains("video") ||
        normalizedReason.contains("فيديو");

    final rejectionText = isVideoRejection
        ? LocaleKeys.subscription_status_rejectionReasonDescription.tr()
        : (rejection?.reasonDetail ?? "");

    final buttonText =
        isVideoRejection ? LocaleKeys.button_reuploadVideo.tr() : "Re-submit";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${LocaleKeys.subscription_status_rejectionReason.tr()}:",
          style: AppTextStyles.font16TextW400,
        ),
        4.verticalSpace,
        Text(
          rejectionText,
          style: const TextStyle(color: Colors.black87),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () => _onResubmitPressed(context, subscription),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navyBlue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text(buttonText),
        ),
      ],
    );
  }

  void _onResubmitPressed(
      BuildContext context, SubscriptionModel subscription) {
    final subCubit = context.read<SubscriptionCubit>();

    bool isVideoRejection = false;

    if (subscription.rejectionReasons!.isNotEmpty) {
      final rejection = subscription.rejectionReasons!.first.rejectionReason;
      isVideoRejection = rejection.toLowerCase().contains("video") ||
          rejection.contains("فيديو");
    }
    subCubit.setCurrentResubmittingSub(subscription);

    context.router.push(StudentSubscriptionRoute(
      isResubmit: true,
      programId: subCubit.state.programId,
      initialStepIndex: isVideoRejection ? 3 : 1,
      isVideoRejection: isVideoRejection,
      subscriptionCubit: subCubit,
    ));
  }
}

class RejectionHelper {
  final SubscriptionModel subscription;
  RejectionHelper(this.subscription);

  bool get isVideoRejection {
    final rejection = (subscription.rejectionReasons?.isNotEmpty ?? false)
        ? subscription.rejectionReasons!.first.rejectionReason
        : "";
    final normalized = rejection.toLowerCase().trim();
    return normalized.contains("video") || normalized.contains("فيديو");
  }

  String get rejectionText => isVideoRejection
      ? LocaleKeys.subscription_status_rejectionReasonDescription.tr()
      : (subscription.rejectionReasons?.first.reasonDetail ?? "");

  String get buttonText =>
      isVideoRejection ? LocaleKeys.button_reuploadVideo.tr() : "Re-submit";

  void onResubmitPressed(BuildContext context) {
    final subCubit = context.read<SubscriptionCubit>();
    final latestSub = subCubit.state.subscriptions.isNotEmpty
        ? subCubit.state.subscriptions.first
        : null;

    final bool latestIsVideoRejection = latestSub != null &&
        latestSub.rejectionReasons!.isNotEmpty &&
        (latestSub.rejectionReasons!.first.rejectionReason
                .toLowerCase()
                .contains("video") ||
            latestSub.rejectionReasons!.first.rejectionReason
                .contains("فيديو"));

    context.router.push(StudentSubscriptionRoute(
      isResubmit: true,
      programId: subCubit.state.programId,
      initialStepIndex: latestIsVideoRejection ? 3 : 1,
      isVideoRejection: latestIsVideoRejection,
      subscriptionCubit: subCubit,
    ));
  }
}

extension SubscriptionStatusX on SubscriptionStatus {
  int get requestStatusId {
    return switch (this) {
      SubscriptionStatus.pending => 1,
      SubscriptionStatus.approved => 2,
      SubscriptionStatus.rejected => 3,
      SubscriptionStatus.completed => 4,
      SubscriptionStatus.certified => 5,
      SubscriptionStatus.cancelled => 6,
      SubscriptionStatus.suspended => 7,
    };
  }
}
