part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(0) int id,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('') String dateOfBirth,
    @Default('') String email,
    @Default(false) bool isVerified,
    @Default(false) bool isLoginCompleted,
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
    UserInfo? userInfo,
    BaseField? userStatus,
    String? appLang,
    @Default([]) List<UserIdentity> userIdentities,
    @Default([]) List<StudentRecitation> studentRecitations,
    @Default([]) List<XFile> userIdentityFiles,
    XFile? videoFile,
  }) = _UserState;
}
