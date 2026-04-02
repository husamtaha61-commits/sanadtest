// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCheckoutResponseImpl _$$PaymentCheckoutResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCheckoutResponseImpl(
      orderId: json['orderId'] as String,
      sessionId: json['sessionId'] as String,
      successIndicator: json['successIndicator'] as String,
      hostedPageUrl: json['hostedPageUrl'] as String,
    );

Map<String, dynamic> _$$PaymentCheckoutResponseImplToJson(
        _$PaymentCheckoutResponseImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'sessionId': instance.sessionId,
      'successIndicator': instance.successIndicator,
      'hostedPageUrl': instance.hostedPageUrl,
    };
