import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/post_student_subscribition_model_response.dart';

part 'student_subscription_data.freezed.dart';

@freezed
class StudentSubscriptionData with _$StudentSubscriptionData {
  const factory StudentSubscriptionData({
    required String token,
    required String whatsAppUrl,
  }) = _StudentSubscriptionData;

  factory StudentSubscriptionData.fromResponse(
      StudentSubscriptionDataModel? response) {
    return StudentSubscriptionData(
      token: response?.token ?? '',
      whatsAppUrl: response?.whatsAppUrl ?? '',
    );
  }
}
