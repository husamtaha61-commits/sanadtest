import 'package:json_annotation/json_annotation.dart';

part 'reciter_validation_submit_job_step_1_request.g.dart';

@JsonSerializable(createFactory: false)
class ReciterValidationSubmitJobStep1Request {
  final String email;
  final String phoneNumber;

  ReciterValidationSubmitJobStep1Request({
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() =>
      _$ReciterValidationSubmitJobStep1RequestToJson(this);
}
