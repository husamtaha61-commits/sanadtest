import 'package:freezed_annotation/freezed_annotation.dart';

part 'reciter_available_times_request.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class ReciterAvailableTimesRequest with _$ReciterAvailableTimesRequest {
  const factory ReciterAvailableTimesRequest({
    required int dayId,
    required List<int> hoursIds,
  }) = _ReciterAvailableTimesRequest;
}
