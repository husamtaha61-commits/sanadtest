import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/enums/app_enums.dart';
import 'installment_model_response.dart';

part 'get_student_subscribition_response.freezed.dart';
part 'get_student_subscribition_response.g.dart';

@freezed
class SubscriptionModel with _$SubscriptionModel {
  const factory SubscriptionModel({
    required int id,
    required String program,
    required String createdAt,
    String? recitation,
    List<RejectionReasonModel>? rejectionReasons,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    required SubscriptionStatus status,
    @JsonKey(defaultValue: false) bool? paid,
    @JsonKey(defaultValue: false) bool? isInstallment,
    @JsonKey(defaultValue: 550.0) double? programPrice,
    @JsonKey(defaultValue: <InstallmentModel>[])
    List<InstallmentModel>? installments,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

SubscriptionStatus _statusFromJson(dynamic rawStatus) {
  if (rawStatus is! String) return SubscriptionStatus.pending;
  final normalized = rawStatus.toLowerCase().trim();

  switch (normalized) {
    case 'pending':
    case 'قيد الانتظار':
    case 'بالانتظار':
      return SubscriptionStatus.pending;
    case 'approved':
    case 'مقبولة':
      return SubscriptionStatus.approved;
    case 'rejected':
    case 'مرفوضة':
      return SubscriptionStatus.rejected;
    case 'completed':
    case 'مكتملة':
      return SubscriptionStatus.completed;
    case 'certified':
    case 'معتمدة':
      return SubscriptionStatus.certified;
    case 'cancelled':
    case 'ملغاة':
      return SubscriptionStatus.cancelled;
    case 'suspended':
    case 'معلقة':
      return SubscriptionStatus.suspended;
    default:
      return SubscriptionStatus.pending;
  }
}

String _statusToJson(SubscriptionStatus status) => status.name;

@freezed
class RejectionReasonModel with _$RejectionReasonModel {
  const factory RejectionReasonModel({
    required int id,
    @JsonKey(name: "rejectionReason") required String rejectionReason,
    @JsonKey(name: "reasonDetail") String? reasonDetail,
  }) = _RejectionReasonModel;

  factory RejectionReasonModel.fromJson(Map<String, dynamic> json) =>
      _$RejectionReasonModelFromJson(json);
}
