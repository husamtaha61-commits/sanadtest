part of 'announcements_cubit.dart';

@freezed
class AnnouncementsState with _$AnnouncementsState {
  const factory AnnouncementsState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<Announcement> announcements,
  }) = _AnnouncementsState;
}
