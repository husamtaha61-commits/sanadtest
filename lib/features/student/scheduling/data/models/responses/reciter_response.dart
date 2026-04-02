import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/responses/base_field_response.dart';

part 'reciter_response.g.dart';
part 'reciter_response.freezed.dart';

@Freezed(toJson: false)
class ReciterResponse with _$ReciterResponse {
  const factory ReciterResponse({
    int? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? description,
    String? profileImageId,
    String? videoId,
    String? nationalityName,
    String? countryIsocode,
    List<BaseFieldResponse>? teachingLanguages,
    bool? isFavorite,
    bool? isRecievingNewStudents,
    List<BaseFieldResponse>? recitations,
  }) = _ReciterResponse;

  factory ReciterResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciterResponseFromJson(json);
}
