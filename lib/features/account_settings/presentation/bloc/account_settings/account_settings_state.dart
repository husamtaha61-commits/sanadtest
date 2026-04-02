part of 'account_settings_cubit.dart';

@freezed
class AccountSettingsState with _$AccountSettingsState {
  const factory AccountSettingsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(true) bool isReadMode,
    @Default("") String backendMessage,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String dateOfBirth,
    BaseField? nationality,
    BaseField? country,
    Language? mainLanguage,
    @Default([]) List<Language> learningLanguages,
    BaseField? recitation,
    String? gender,
    XFile? profileImageFile,
    XFile? videoFile,
    @Default([]) List<XFile> userIdentityFiles,
    @Default([]) List<XFile> certificates,
    @Default([]) List<XFile> otherCertificates,
    int? genderId,
    int? userIdentityTypeId,
    PhoneNumber? phoneNumber,
  }) = _AccountSettingsState;
}
