part of 'student_profile_cubit.dart';

@freezed
class StudentProfileState with _$StudentProfileState {
  const factory StudentProfileState({
    @Default(BaseStatus.initial()) BaseStatus status,
    // UserInfo? studentInfo,
    @Default(0) int id,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('') String dateOfBirth,
    @Default('') String email,
    @Default(false) bool isVerified,
    @Default(false) bool hasActiveSchedule,
    UserRole? role,
    String? phoneNumber,
    Language? mainLanguage,
    @Default([]) List<Language> learningLanguages,
    UserPlaceOfResidence? placeOfResidence,
    UserNationality? nationality,
    String? introVideoUrl,
    String? profileImageUrl,
    String? description,
    Gender? gender,
    SubscriptionStatus? subscriptionStatus,
  }) = _StudentProfileState;
}
