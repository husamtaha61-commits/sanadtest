// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstallmentModelImpl _$$InstallmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstallmentModelImpl(
      number: (json['number'] as num).toInt(),
      paid: json['paid'] as bool? ?? false,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$InstallmentModelImplToJson(
        _$InstallmentModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'paid': instance.paid,
      'amount': instance.amount,
    };
