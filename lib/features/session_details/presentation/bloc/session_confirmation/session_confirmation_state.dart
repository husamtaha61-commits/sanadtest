part of 'session_confirmation_cubit.dart';

@freezed
class SessionConfirmationState with _$SessionConfirmationState {
  const factory SessionConfirmationState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(1) int activeStep,
    @Default([]) List<Page> pages,
    bool? actionValue,
    @Default(1) int lastPage,
  }) = _SessionConfirmationState;
}
