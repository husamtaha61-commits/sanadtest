part of 'global_reciters_section_cubit.dart';

@freezed
class GlobalRecitersSectionState with _$GlobalRecitersSectionState {
  const factory GlobalRecitersSectionState({
    @Default(BaseStatus.initial()) BaseStatus status,
    GlobalRecitersSection? globalRecitersSection,
  }) = _GlobalRecitersSectionState;
}
