import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final String? transactionId;
  final VoidCallback onContinue;

  const PaymentSuccessDialog({
    super.key,
    this.transactionId,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 64.w,
              color: theme.colorScheme.primary,
            ),
            16.verticalSpace,
            Text(
              'Payment Successful!',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            8.verticalSpace,
            Text(
              'Your payment has been processed successfully.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: .7),
              ),
            ),
            if (transactionId != null) ...[
              16.verticalSpace,
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Text(
                      'Transaction ID:',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        transactionId!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade600,
                              fontFamily: 'monospace',
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            24.verticalSpace,
            ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48.h),
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentFailureDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onClose;

  const PaymentFailureDialog({
    super.key,
    required this.errorMessage,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.w,
              color: theme.colorScheme.error,
            ),
            16.verticalSpace,
            Text(
              'Payment Failed',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            8.verticalSpace,
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: .7),
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onClose,
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(0, 48.h),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
