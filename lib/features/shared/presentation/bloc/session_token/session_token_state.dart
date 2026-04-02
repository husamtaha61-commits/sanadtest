part of 'session_token_cubit.dart';

@freezed
class SessionTokenState with _$SessionTokenState {
  const factory SessionTokenState({
    @Default(BaseStatus.initial()) BaseStatus status,
  }) = _SessionTokenState;
}
