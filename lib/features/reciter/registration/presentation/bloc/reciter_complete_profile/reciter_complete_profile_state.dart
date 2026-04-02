part of 'reciter_complete_profile_cubit.dart';

@freezed
class ReciterCompleteProfileState with _$ReciterCompleteProfileState {
  const factory ReciterCompleteProfileState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(1) int activeIndex,
    @Default(false) bool isChecked1,
    @Default(false) bool isChecked2,
    XFile? profilePicture,
    XFile? video,
    @Default(1) int? paymentTypeId,
    @Default('') String? bankIban,
    @Default('') String? bankSwiftCode,
    @Default('') String? bankName,
    @Default('') String? payPalAccountNumber,
    @Default('') String? westernUploadedId,
    @Default([]) List<ReciterAvailableTimesRequest> reciterAvailableTimes,
  }) = _ReciterCompleteProfileState;
}
