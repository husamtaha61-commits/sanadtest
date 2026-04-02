import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment_model_response.freezed.dart';
part 'installment_model_response.g.dart';

@freezed
class InstallmentModel with _$InstallmentModel {
  const factory InstallmentModel({
    required int number,
    @JsonKey(defaultValue: false) bool? paid,
    required double amount,
  }) = _InstallmentModel;

  factory InstallmentModel.fromJson(Map<String, dynamic> json) =>
      _$InstallmentModelFromJson(json);
}
