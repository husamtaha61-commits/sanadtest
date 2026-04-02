import 'package:json_annotation/json_annotation.dart';

part 'khitma_suspension_request.g.dart';

@JsonSerializable(createFactory: false)
class KhitmaSuspensionRequest {
  final String startDate;
  final String endDate;
  final int reasonId;
  final String? otherReason;

  KhitmaSuspensionRequest({
    required this.startDate,
    required this.endDate,
    required this.reasonId,
    this.otherReason,
  });

  Map<String, dynamic> toJson() => _$KhitmaSuspensionRequestToJson(this);
}
