// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_subscribition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      id: (json['id'] as num).toInt(),
      program: json['program'] as String,
      createdAt: json['createdAt'] as String,
      recitation: json['recitation'] as String?,
      rejectionReasons: (json['rejectionReasons'] as List<dynamic>?)
          ?.map((e) => RejectionReasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: _statusFromJson(json['status']),
      paid: json['paid'] as bool? ?? false,
      isInstallment: json['isInstallment'] as bool? ?? false,
      programPrice: (json['programPrice'] as num?)?.toDouble() ?? 550.0,
      installments: (json['installments'] as List<dynamic>?)
              ?.map((e) => InstallmentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'createdAt': instance.createdAt,
      'recitation': instance.recitation,
      'rejectionReasons': instance.rejectionReasons,
      'status': _statusToJson(instance.status),
      'paid': instance.paid,
      'isInstallment': instance.isInstallment,
      'programPrice': instance.programPrice,
      'installments': instance.installments,
    };

_$RejectionReasonModelImpl _$$RejectionReasonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RejectionReasonModelImpl(
      id: (json['id'] as num).toInt(),
      rejectionReason: json['rejectionReason'] as String,
      reasonDetail: json['reasonDetail'] as String?,
    );

Map<String, dynamic> _$$RejectionReasonModelImplToJson(
        _$RejectionReasonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rejectionReason': instance.rejectionReason,
      'reasonDetail': instance.reasonDetail,
    };
