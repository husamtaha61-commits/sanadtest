import 'package:json_annotation/json_annotation.dart';

part 'last_page_response.g.dart';

@JsonSerializable()
class LastPageResponse {
  final int? page;

  LastPageResponse({this.page});

  factory LastPageResponse.fromJson(Map<String, dynamic> json) =>
      _$LastPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LastPageResponseToJson(this);
}
