import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_student_subscribition_model_response.freezed.dart';
part 'post_student_subscribition_model_response.g.dart';

@freezed
class StudentSubscriptionDataModel with _$StudentSubscriptionDataModel {
  const factory StudentSubscriptionDataModel({
    @Default('') String token,
    @Default('') String whatsAppUrl,
  }) = _StudentSubscriptionDataModel;

  factory StudentSubscriptionDataModel.fromJson(Map<String, dynamic> json) =>
      _$StudentSubscriptionDataModelFromJson(json);
}
