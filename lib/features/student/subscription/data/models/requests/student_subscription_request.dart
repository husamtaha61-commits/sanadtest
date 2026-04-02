import 'dart:io';

class StudentSubscriptionRequest {
  final int programId;
  final String firstName;
  final String? middleName;
  final String lastName;
  final int genderId;
  final String dateOfBirth;
  final int nationalityId;
  final int mainLanguageId;
  final List<String>? otherLanguagesIds;
  final String phoneNumber;
  final int placeOfResidenceId;
  final int identityTypeId;
  final List<File> images;
  final File? video;
  final int recitationId;
  final int evaluationMethod;
  final String preferredLanguage;
  final int? recieverId;
  final int? dayId;
  final int? timeId;
  final String? suggestionTime;

  StudentSubscriptionRequest({
    required this.programId,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.genderId,
    required this.dateOfBirth,
    required this.nationalityId,
    required this.mainLanguageId,
    this.otherLanguagesIds,
    required this.phoneNumber,
    required this.placeOfResidenceId,
    required this.identityTypeId,
    required this.images,
    this.video,
    required this.recitationId,
    required this.evaluationMethod,
    required this.preferredLanguage,
    this.recieverId,
    this.dayId,
    this.timeId,
    required this.suggestionTime,
  });
}
