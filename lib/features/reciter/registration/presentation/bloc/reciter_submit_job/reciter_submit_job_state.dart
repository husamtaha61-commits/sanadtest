part of 'reciter_submit_job_cubit.dart';

@freezed
class ReciterSubmitJobState with _$ReciterSubmitJobState {
  const factory ReciterSubmitJobState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(1) int activeIndex,
    BaseField? document,
    XFile? frontImage,
    XFile? backImage,
    @Default([]) List<CertificateData> certificates,
    @Default([]) List<XFile> otherCertificates,
  }) = _ReciterSubmitJobState;
}
