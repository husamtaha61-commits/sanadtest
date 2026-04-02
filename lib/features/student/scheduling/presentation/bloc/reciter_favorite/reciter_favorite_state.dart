part of 'reciter_favorite_cubit.dart';

@freezed
class ReciterFavoriteState with _$ReciterFavoriteState {
  const factory ReciterFavoriteState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(false) bool isFav,
    @Default('') String msg,
  }) = _ReciterFavoriteState;
}
