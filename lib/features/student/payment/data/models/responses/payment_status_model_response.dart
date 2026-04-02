import 'package:json_annotation/json_annotation.dart';

part 'payment_status_model_response.g.dart';

@JsonSerializable()
class PaymentStatusModel {
  final bool paid;
  final String reason;

  PaymentStatusModel({
    required this.paid,
    required this.reason,
  });

  factory PaymentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusModelFromJson(json);
}
