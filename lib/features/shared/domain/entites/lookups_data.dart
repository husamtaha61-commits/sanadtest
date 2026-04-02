import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/base_field.dart';
import '../../data/models/responses/lookups_data_response.dart';

part 'lookups_data.g.dart';

@JsonSerializable()
class LookupsData {
  final List<BaseField> languages;
  final List<BaseField> nationalities;
  final List<BaseField> countries;
  final List<BaseField> genders;
  final List<BaseField> recitations;
  final List<BaseField> recitationTypes;
  final List<BaseField> userIdTypes;
  final List<BaseField> ageRanges;
  final List<BaseField> requestStatuses;
  final List<BaseField> requestTypes;
  final List<BaseField> requesterSide;
  final List<BaseField> days;
  final List<BaseField> averageIntervals;

  LookupsData({
    required this.languages,
    required this.nationalities,
    required this.countries,
    required this.genders,
    required this.recitations,
    required this.recitationTypes,
    required this.userIdTypes,
    required this.ageRanges,
    required this.requestStatuses,
    required this.requestTypes,
    required this.requesterSide,
    required this.days,
    required this.averageIntervals,
  });

  factory LookupsData.fromResponse(LookUpsDataResponse response) => LookupsData(
        languages: (response.languages ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        nationalities: (response.nationalities ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        countries: (response.countries ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        genders: (response.genders ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        recitations: (response.recitations ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        recitationTypes: (response.recitationTypes ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        userIdTypes: (response.userIdTypes ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        ageRanges: (response.ageRanges ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        requestStatuses: (response.requestStatuses ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        requestTypes: (response.requestTypes ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        requesterSide: (response.requesterSide ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        days: (response.days ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
        averageIntervals: (response.averageIntervals ?? [])
            .map((ele) => BaseField.fromResponse(ele))
            .toList(),
      );

  factory LookupsData.fromJson(Map<String, dynamic> json) =>
      _$LookupsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LookupsDataToJson(this);
}
