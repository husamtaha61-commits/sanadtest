part of 'messaging_contact_cubit.dart';

@freezed
class MessagingContactState with _$MessagingContactState {
  const factory MessagingContactState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default([]) List<MessagingContact> contacts,
  }) = _MessagingContactState;
}
