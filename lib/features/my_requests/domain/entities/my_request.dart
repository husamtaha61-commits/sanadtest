import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/responses/base_field_response.dart';
import '../../../reciter/registration/domain/entities/available_times_options.dart';
import '../../data/models/responses/my_requests_response.dart';
part 'my_request.freezed.dart';
part 'my_request.g.dart';

@Freezed(toJson: false)
class MyRequest with _$MyRequest {
  const factory MyRequest({
    required int requestId,
    required Status status,
    required BaseFieldResponse type,
    required UserSenderReciever sender,
    required UserSenderReciever reciever,
    String? note,
    required DateTime creationDate,
    required DateTime oldSessionTime,
    required List<TimeData> scheduleTimes,
    required List<TimeData> previousScheduleTimes,
    List<TimeSuggestionsResponse>? timeSuggestions,
  }) = _MyRequest;

  factory MyRequest.fromJson(Map<String, dynamic> json) =>
      _$MyRequestFromJson(json);

  factory MyRequest.fromResponse(MyRequestsResponse response) => MyRequest(
        requestId: response.requestId,
        status: response.status,
        type: response.type,
        sender: response.sender,
        reciever: response.reciever,
        note: response.note,
        creationDate: response.creationDate ?? DateTime.now(),
        oldSessionTime: response.oldSessionTime ?? DateTime.now(),
        scheduleTimes: AvailableTimesProcessor.fromTimeDateResponse(
          response.scheduleTimes,
        ),
        previousScheduleTimes: response.previousScheduleTimes != null ? AvailableTimesProcessor.fromTimeDateResponse(
          response.previousScheduleTimes!,
        ) : [],
        timeSuggestions: response.timeSuggestions,
      );
}
