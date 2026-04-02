import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/responses/base_field_response.dart';

part 'program_response.g.dart';

@JsonSerializable()
class ProgramResponse {
  final int? id;
  final double? price;
  final int? numberOfSessions;
  final BaseFieldResponse? programType;
  final List<BaseFieldResponse>? programDescription;
  final BaseFieldResponse? programSubTitle;

  factory ProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramResponseFromJson(json);

  ProgramResponse({
    this.id,
    this.price,
    this.numberOfSessions,
    this.programType,
    this.programDescription,
    this.programSubTitle,
  });

  Map<String, dynamic> toJson() => _$ProgramResponseToJson(this);
}
