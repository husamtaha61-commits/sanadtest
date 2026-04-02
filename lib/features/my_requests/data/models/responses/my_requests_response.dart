import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/responses/base_field_response.dart';
import '../../../../../core/utils/date_time_converter.dart';
import '../../../../reciter/registration/data/models/responses/available_times_options_response.dart';
import '../../../../shared/data/models/responses/user_role_response.dart.dart';

part 'my_requests_response.g.dart';
part 'my_requests_response.freezed.dart';

@Freezed(toJson: false)
class MyRequestsResponse with _$MyRequestsResponse {
  const factory MyRequestsResponse({
    required int requestId,
    required Status status,
    required BaseFieldResponse type,
    required UserSenderReciever sender,
    required UserSenderReciever reciever,
    String? note,
    @DateTimeConverter() DateTime? creationDate,
    @DateTimeConverter() DateTime? oldSessionTime,
    required List<TimeDataResponse> scheduleTimes,
    required List<TimeDataResponse>? previousScheduleTimes,
    List<TimeSuggestionsResponse>? timeSuggestions,
  }) = _MyRequestsResponse;

  factory MyRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyRequestsResponseFromJson(json);
}

@Freezed(toJson: false)
class Status with _$Status {
  const factory Status({required int id, required String name}) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@Freezed(toJson: false)
class UserSenderReciever with _$UserSenderReciever {
  const factory UserSenderReciever({
    required int id,
    required String firstName,
    required String? middleName,
    required String lastName,
    required String? profileImageUrl,
    required String? description,
    required DateTime dateOfBirth,
    required List<UserRoleResponse> roles,
  }) = _UserSenderReciever;

  factory UserSenderReciever.fromJson(Map<String, dynamic> json) =>
      _$UserSenderRecieverFromJson(json);
}

@Freezed(toJson: false)
class TimeSuggestionsResponse with _$TimeSuggestionsResponse {
  const factory TimeSuggestionsResponse({
    int? suggestionId,
    @DateTimeConverter() DateTime? suggestionDateTime,
  }) = _TimeSuggestionsResponse;

  factory TimeSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeSuggestionsResponseFromJson(json);
}
