import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../domain/entities/payment_plan_request.dart';

class PaymentPlanCard extends StatelessWidget {
  final PaymentPlan plan;
  final bool isSelected;
  final VoidCallback onSelect;
  final int? phase;
  const PaymentPlanCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onSelect,
    this.phase,
  });

  @override
  Widget build(BuildContext context) {
    final hasInstallments =
        plan.installments != null && plan.installments!.isNotEmpty;
    final initialPercent = (plan.type == PaymentPlanType.installment &&
            hasInstallments &&
            plan.price > 0)
        ? (plan.installments!.first.amount / plan.price) * 100
        : null;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.type == PaymentPlanType.installment
                            ? LocaleKeys.paymentPlan_type_installment.tr()
                            : LocaleKeys.paymentPlan_type_fullPayment.tr(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      4.verticalSpace,
                      // Text(
                      //   plan.description,
                      //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      //         color: Colors.grey.shade600,
                      //       ),
                      // ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24.w,
                  ),
              ],
            ),

            16.verticalSpace,

            // Price
            if (plan.type == PaymentPlanType.installment)
              Text(
                '\$${(plan.price / 2).toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            if (plan.type == PaymentPlanType.fullPayment)
              Text(
                '\$${(plan.price).toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            if (plan.type == PaymentPlanType.installment)
              Text(
                LocaleKeys.paymentPlan_initialPayment.tr(namedArgs: {
                  'percent': (initialPercent ?? 0).toStringAsFixed(0),
                }),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),

            16.verticalSpace,

            // // Features
            // ...plan.features.map(
            //   (feature) => PlanFeatureItem(feature: feature),
            // ),

            // Installments
            if (plan.installments != null) ...[
              16.verticalSpace,
              Text(
                LocaleKeys.paymentPlan_paymentSchedule.tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              8.verticalSpace,
              ...plan.installments!.map(
                (installment) {
                  final isCurrentPhase =
                      phase != null && installment.number == phase;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('•', style: TextStyle(fontSize: 16.sp)),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isCurrentPhase
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade300,
                              width: isCurrentPhase ? 1.5 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                            color: isCurrentPhase
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.08)
                                : Colors.transparent,
                          ),
                          child: Text(
                            '${LocaleKeys.paymentPlan_phase.tr()} ${installment.number}: \$${installment.amount}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: isCurrentPhase
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isCurrentPhase
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],

            // if (plan.warningMessage != null) ...[
            //   16.verticalSpace,
            //   Container(
            //     padding: EdgeInsets.all(12.w),
            //     decoration: BoxDecoration(
            //       color: Colors.orange.shade50,
            //       borderRadius: BorderRadius.circular(8.r),
            //       border: Border.all(color: Colors.orange.shade200),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.warning_amber_rounded,
            //           color: Colors.orange.shade600,
            //           size: 16.w,
            //         ),
            //         8.horizontalSpace,
            //         Expanded(
            //           child: Text(
            //             plan.warningMessage!,
            //             style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //                   color: Colors.orange.shade800,
            //                 ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],

            16.verticalSpace,

            // Select Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
                  foregroundColor:
                      isSelected ? Colors.white : Colors.grey.shade700,
                ),
                child: Text(
                  isSelected
                      ? LocaleKeys.paymentPlan_selected.tr()
                      : LocaleKeys.paymentPlan_selectPlan.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
