import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_request_request.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ApproveRequestRequest {
  final int scheduleRequestId;
  final String? startDate;
  final int? approvedSuggestionId;

  ApproveRequestRequest({
    required this.scheduleRequestId,
    this.startDate,
    this.approvedSuggestionId,
  });

  Map<String, dynamic> toJson() => _$ApproveRequestRequestToJson(this);
}
