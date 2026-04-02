import 'package:freezed_annotation/freezed_annotation.dart';
part 'available_times_options_response.g.dart';
part 'available_times_options_response.freezed.dart';

@Freezed(toJson: false)
class TimeDataResponse with _$TimeDataResponse {
  const factory TimeDataResponse({
    required int? dayId,
    required int? timeId,
    required String? timeValue,
    required bool? isReserved,
    String? dateTime,
  }) = _TimeDataResponse;

  factory TimeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeDataResponseFromJson(json);
}
