part of 'home_sections_cubit.dart';

@freezed
class HomeSectionsState with _$HomeSectionsState {
  const factory HomeSectionsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<HomeSection> sections,
  }) = _HomeSectionsState;
}
