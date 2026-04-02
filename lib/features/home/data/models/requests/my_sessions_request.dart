import 'package:json_annotation/json_annotation.dart';
part 'my_sessions_request.g.dart';

@JsonSerializable(createFactory: false)
class MySessionsRequest {
  final String? dateStart;
  final String? dateLimit;

  MySessionsRequest({required this.dateStart, required this.dateLimit});

  Map<String, dynamic> toJson() => _$MySessionsRequestToJson(this);
}
