// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentStatusModel _$PaymentStatusModelFromJson(Map<String, dynamic> json) =>
    PaymentStatusModel(
      paid: json['paid'] as bool,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$PaymentStatusModelToJson(PaymentStatusModel instance) =>
    <String, dynamic>{
      'paid': instance.paid,
      'reason': instance.reason,
    };
