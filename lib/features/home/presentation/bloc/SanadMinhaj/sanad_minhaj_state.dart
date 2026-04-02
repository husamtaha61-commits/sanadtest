part of 'sanad_minhaj_progress_cubit.dart';

@freezed
class SanadMinhajProgressState with _$SanadMinhajProgressState {
  const factory SanadMinhajProgressState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<SanadMinhajCourse> courses,
    @Default({}) Map<int, List<Session>> sessionsByCourseId,
  }) = _SanadMinhajProgressState;
}
