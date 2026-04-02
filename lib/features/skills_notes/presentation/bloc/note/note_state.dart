part of 'note_cubit.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Note> notes,
  }) = _NoteState;
}
