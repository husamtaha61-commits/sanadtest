// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCheckoutRequestImpl _$$PaymentCheckoutRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCheckoutRequestImpl(
      subscriptionId: (json['subscriptionId'] as num).toInt(),
      isInstallment: json['isInstallment'] as bool,
      currency: json['currency'] as String,
      customerEmail: json['customerEmail'] as String,
    );

Map<String, dynamic> _$$PaymentCheckoutRequestImplToJson(
        _$PaymentCheckoutRequestImpl instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'isInstallment': instance.isInstallment,
      'currency': instance.currency,
      'customerEmail': instance.customerEmail,
    };
