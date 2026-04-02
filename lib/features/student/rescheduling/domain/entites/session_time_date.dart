import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../reciter/registration/domain/entities/available_times_options.dart';

part 'session_time_date.freezed.dart';
part 'session_time_date.g.dart';

@Freezed(toJson: false)
class SessionTimeDate with _$SessionTimeDate {
  const factory SessionTimeDate({
    int? newDayId,
    int? newTimeId,
    required TimeData timeDataResponse,
  }) = _SessionTimeDate;

  factory SessionTimeDate.fromJson(Map<String, dynamic> json) =>
      _$SessionTimeDateFromJson(json);
}
