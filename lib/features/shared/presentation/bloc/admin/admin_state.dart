part of 'admin_cubit.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    @Default(BaseStatus.initial()) BaseStatus status,
    AdminConfigResponse? adminConfig,
  }) = _AdminState;
}
