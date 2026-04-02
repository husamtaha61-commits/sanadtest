import 'package:freezed_annotation/freezed_annotation.dart';
part 'complete_session_request.g.dart';

@JsonSerializable(createFactory: false)
class CompleteSessionRequest {
  final String sessionId;
  final int startPage;
  final int endPage;
  final bool isCompleted;

  CompleteSessionRequest({
    required this.sessionId,
    required this.startPage,
    required this.endPage,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() => _$CompleteSessionRequestToJson(this);
}
