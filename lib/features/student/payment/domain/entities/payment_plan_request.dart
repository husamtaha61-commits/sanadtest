import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../subscription/data/models/responses/installment_model_response.dart';

part 'payment_plan_request.freezed.dart';
part 'payment_plan_request.g.dart';

@freezed
class PaymentPlan with _$PaymentPlan {
  const factory PaymentPlan({
    required PaymentPlanType type,
    required double price,
    List<InstallmentModel>? installments,
  }) = _PaymentPlan;

  factory PaymentPlan.fromJson(Map<String, dynamic> json) =>
      _$PaymentPlanFromJson(json);
}

enum PaymentPlanType {
  fullPayment,
  installment,
}

extension PaymentPlanTypeExt on PaymentPlanType {
  String get label {
    switch (this) {
      case PaymentPlanType.fullPayment:
        return 'Full Payment';
      case PaymentPlanType.installment:
        return 'Installment';
    }
  }
}
