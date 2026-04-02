import 'package:json_annotation/json_annotation.dart';

part 'reschedule_session_once_request.g.dart';

@JsonSerializable(createFactory: false)
class RescheduleSessionOnceRequest {
  final String sessionId;
  final List<String> suggestionTimes;
  final String? note;

  RescheduleSessionOnceRequest({
    required this.sessionId,
    required this.suggestionTimes,
    this.note,
  });

  Map<String, dynamic> toJson() => _$RescheduleSessionOnceRequestToJson(this);
}
