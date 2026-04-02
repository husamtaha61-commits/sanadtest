part of 'program_cubit.dart';

@freezed
class ProgramState with _$ProgramState {
  const factory ProgramState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Program> programs,
  }) = _ProgramState;
}
