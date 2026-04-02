import 'package:json_annotation/json_annotation.dart';

part 'add_extra_session_request.g.dart';

@JsonSerializable(createFactory: false)
class AddExtraSessionRequest {
  final List<String> suggestionTimes;
  final int durationInMinutes;
  final String? note;
  final int reciterId;

  AddExtraSessionRequest({
    required this.suggestionTimes,
    required this.durationInMinutes,
    this.note,
    required this.reciterId,
  });

  Map<String, dynamic> toJson() => _$AddExtraSessionRequestToJson(this);
}
