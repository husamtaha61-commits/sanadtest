part of 'messaging_cubit.dart';

@freezed
class MessagingState with _$MessagingState {
  const factory MessagingState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default('') String token,
    @Default({}) Map<String, MessagingConversation> conversations,
    @Default(false) bool isTwilioClientSync,
    @Default(false) bool isNewConversation,
  }) = _MessagingState;
}
