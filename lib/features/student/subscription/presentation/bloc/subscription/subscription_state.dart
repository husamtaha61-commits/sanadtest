part of 'subscription_cubit.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(1) int activeIndex,
    @Default(0) int programId,
    @Default(false) bool isCheckedDate,
    BaseField? document,
    XFile? frontImage,
    XFile? backImage,
    XFile? video,
    String? videoUrl,
    SubscriptionModel? currentResubmittingSub,
    @Default(false) bool isCheckedVideo,
    @Default(false) bool isCheckedVidRecord,
    @Default(false) bool phoneNumberIsExist,
    @Default(-1) int sentBytes,
    @Default([]) List<SubscriptionModel> subscriptions,
    @Default(true) bool allowEditingAllFields,
    @Default(false) bool isResubmitting,
    @Default(-1) int totalBytes,
    @Default(1) int evaluationMethod,
    @Default('') String whatsAppUrl,
    @Default(false) bool showSuccessDialog,
    int? recieverId,
    int? dayId,
    int? timeId,
    String? suggestionTime,
  }) = _SubscriptionState;
}
