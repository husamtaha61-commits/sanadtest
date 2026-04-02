part of 'lookup_cubit.dart';

@freezed
class LookupState with _$LookupState {
  const factory LookupState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<BaseField> languages,
    @Default([]) List<BaseField> nationalities,
    @Default([]) List<BaseField> countries,
    @Default([]) List<BaseField> genders,
    @Default([]) List<BaseField> recitations,
    @Default([]) List<BaseField> recitationTypes,
    @Default([]) List<BaseField> userIdTypes,
    @Default([]) List<BaseField> ageRanges,
    @Default([]) List<BaseField> requestStatuses,
    @Default([]) List<BaseField> requestTypes,
    @Default([]) List<BaseField> requesterSides,
    @Default([]) List<BaseField> days,
    @Default([]) List<BaseField> averageIntervals,
  }) = _LookupState;
}
