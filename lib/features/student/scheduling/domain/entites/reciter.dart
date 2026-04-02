import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/base_field.dart';
import '../../data/models/responses/reciter_response.dart';

part 'reciter.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class Reciter with _$Reciter {
  const factory Reciter({
    required int id,
    required String firstName,
    required String middleName,
    required String gender,
    required String lastName,
    required String dateOfBirth,
    String? description,
    required String profileImageId,
    String? videoId,
    required String nationalityName,
    required String countryIsocode,
    required List<BaseField> teachingLanguages,
    required bool isFavorite,
    required bool isReceivingNewStudents,
    List<BaseField>? recitations,
  }) = _Reciter;

  factory Reciter.fromResponse(ReciterResponse? response) {
    if (response == null) {
      return const Reciter(
        id: -1,
        firstName: "",
        middleName: "",
        lastName: "",
        dateOfBirth: "",
        gender: "",
        description: null,
        profileImageId: "",
        videoId: null,
        nationalityName: "",
        countryIsocode: "",
        teachingLanguages: [],
        isFavorite: false,
        isReceivingNewStudents: false,
        recitations: null,
      );
    }
    return Reciter(
      id: response.id ?? -1,
      firstName: response.firstName ?? "",
      middleName: response.middleName ?? "",
      lastName: response.lastName ?? "",
      dateOfBirth: response.dateOfBirth ?? "",
      gender: response.gender ?? "",
      description: response.description,
      profileImageId: response.profileImageId ?? "",
      videoId: response.videoId,
      nationalityName: response.nationalityName ?? "",
      countryIsocode: response.countryIsocode ?? "",
      teachingLanguages: (response.teachingLanguages ?? [])
          .map((lang) => BaseField.fromResponse(lang))
          .toList(),
      isFavorite: response.isFavorite ?? false,
      isReceivingNewStudents: response.isRecievingNewStudents ?? false,
      recitations: (response.recitations ?? [])
          .map((recitation) => BaseField.fromResponse(recitation))
          .toList(),
    );
  }
}
