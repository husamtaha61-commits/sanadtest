import 'package:freezed_annotation/freezed_annotation.dart';
part 'generate_meeting_response.g.dart';

@JsonSerializable()
class GenerateMeetingResponse {
  final String url;

  const GenerateMeetingResponse({
    required this.url,
  });

  factory GenerateMeetingResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateMeetingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateMeetingResponseToJson(this);
}
