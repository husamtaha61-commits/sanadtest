import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_reciter_availability_request.freezed.dart';
part 'change_reciter_availability_request.g.dart';

@Freezed(toJson: true)
@JsonSerializable()
class ChangeReciterAvailabilityRequest with _$ChangeReciterAvailabilityRequest {
  const factory ChangeReciterAvailabilityRequest({
    required int dayId,
    required List<int> hoursIds
  }) = _ChangeReciterAvailabilityRequest;

  Map<String, dynamic> toJson() => _$ChangeReciterAvailabilityRequestToJson(this);
}
