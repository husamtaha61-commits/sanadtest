part of 'slider_content_cubit.dart';

@freezed
class SliderContentState with _$SliderContentState {
  const factory SliderContentState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<SliderContent> sliderContent,
  }) = _SliderContentState;
}
