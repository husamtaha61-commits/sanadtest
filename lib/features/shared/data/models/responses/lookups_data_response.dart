import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/responses/base_field_response.dart';
part 'lookups_data_response.g.dart';

@JsonSerializable()
class LookUpsDataResponse {
  final List<BaseFieldResponse>? languages;
  final List<BaseFieldResponse>? nationalities;
  final List<BaseFieldResponse>? countries;
  final List<BaseFieldResponse>? genders;
  final List<BaseFieldResponse>? recitations;
  final List<BaseFieldResponse>? recitationTypes;
  final List<BaseFieldResponse>? userIdTypes;
  final List<BaseFieldResponse>? ageRanges;
  final List<BaseFieldResponse>? requestStatuses;
  final List<BaseFieldResponse>? requestTypes;
  final List<BaseFieldResponse>? requesterSide;
  final List<BaseFieldResponse>? days;
  final List<BaseFieldResponse>? averageIntervals;

  factory LookUpsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LookUpsDataResponseFromJson(json);

  LookUpsDataResponse({
    this.languages,
    this.nationalities,
    this.countries,
    this.genders,
    this.recitations,
    this.recitationTypes,
    this.userIdTypes,
    this.ageRanges,
    this.requestStatuses,
    this.requestTypes,
    this.requesterSide,
    this.days,
    this.averageIntervals,
  });

  Map<String, dynamic> toJson() => _$LookUpsDataResponseToJson(this);
}
