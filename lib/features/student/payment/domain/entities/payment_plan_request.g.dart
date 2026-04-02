// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_plan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentPlanImpl _$$PaymentPlanImplFromJson(Map<String, dynamic> json) =>
    _$PaymentPlanImpl(
      type: $enumDecode(_$PaymentPlanTypeEnumMap, json['type']),
      price: (json['price'] as num).toDouble(),
      installments: (json['installments'] as List<dynamic>?)
          ?.map((e) => InstallmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymentPlanImplToJson(_$PaymentPlanImpl instance) =>
    <String, dynamic>{
      'type': _$PaymentPlanTypeEnumMap[instance.type]!,
      'price': instance.price,
      'installments': instance.installments,
    };

const _$PaymentPlanTypeEnumMap = {
  PaymentPlanType.fullPayment: 'fullPayment',
  PaymentPlanType.installment: 'installment',
};
