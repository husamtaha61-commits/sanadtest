part of 'reciter_listing_cubit.dart';

@freezed
class ReciterListingState with _$ReciterListingState {
  const factory ReciterListingState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Reciter> reciters,
  }) = _ReciterListingState;
}
