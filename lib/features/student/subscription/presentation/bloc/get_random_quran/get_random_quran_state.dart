part of 'get_random_quran_cubit.dart';

@freezed
class GetRandomQuranState with _$GetRandomQuranState {
  const factory GetRandomQuranState(
      {@Default(BaseStatus.initial()) BaseStatus status,
      GetRandomQuranResponse? quranTemplate,
      @Default(false) bool isFontLoaded,
      @Default(false) bool isStartRecording}) = _GetRandomQuranState;
}
