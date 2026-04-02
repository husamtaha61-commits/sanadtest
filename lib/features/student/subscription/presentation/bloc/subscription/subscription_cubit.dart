import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/bloc/app/app_cubit.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/entities/base_field.dart';
import '../../../../../../core/extenstions/date_time.dart';
import '../../../../../../core/extenstions/string.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../../../core/services/analytics_service.dart';
import '../../../../../../core/services/app_preferences.dart';
import '../../../../../../core/services/localized_error.dart';
import '../../../../../../core/services/localized_field.dart';
import '../../../../../shared/domain/entites/user_info.dart';
import '../../../../../shared/presentation/bloc/user/user_cubit.dart';
import '../../../data/models/requests/student_subscription_request.dart';

import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../core/utils/app_date.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';
import '../../../data/models/requests/udpate_student_subscription_request.dart';
import '../../../data/models/responses/get_student_subscribition_response.dart';
import '../../../domain/usecases/student_subscription_usecase.dart';
import '../../../domain/usecases/student_update_subsription_usecase.dart';
import '../../../domain/usecases/verify_phone_number_use_case.dart';

part 'subscription_cubit.freezed.dart';
part 'subscription_state.dart';

@injectable
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final StudentSubscriptionUseCase studentSubscriptionUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final UserCubit userCubit;

  SubscriptionCubit(
    this.userCubit,
    this.studentSubscriptionUseCase,
    this.verifyPhoneNumberUseCase,
  ) : super(const SubscriptionState()) {
    prefillFromCache();
  }
  // -------------------- Personal Info -------------------- //

  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final suggestionTime = TextEditingController();
  BaseField? gender;
  BaseField? nationality;
  BaseField? mainLanguage;
  List<BaseField> learningLanguages = [];
  BaseField? country;
  BaseField? recitation;

  final phone = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.JO, nsn: ''),
  );
  void setGender(BaseField? value) => gender = value;
  void setNationality(BaseField? value) => nationality = value;
  void setMainLanguage(BaseField? value) => mainLanguage = value;
  void setLearningLanguages(List<BaseField> values) =>
      learningLanguages = values;
  void setCountryLanguage(BaseField? value) => country = value;
  void setRecitation(BaseField? value) => recitation = value;
  void updateCheckboxDate(bool? value) {
    emit(state.copyWith(isCheckedDate: value ?? false));
  }

  void setActiveIndex(int index) {
    emit(state.copyWith(activeIndex: index));
  }

  bool showSuccessDialog = true;

  bool get isNeedParentConfirmation {
    final int diff =
        DateTime.now().diffInYears(dateOfBirth.text.toDate(AppDate.ddMMyyyy)!);
    return diff >= 13 && diff <= 16;
  }

  Future<void> validatePersonalInfo() async {
    emit(state.copyWith(status: const BaseStatus.initial()));
    errorMsg['isCheckedDate'] = "";

    if (isNeedParentConfirmation) {
      checkAndSetErrorMsg(state.isCheckedDate, 'isCheckedDate');
    }
    if (!formKey.currentState!.validate() ||
        errorMsg.containsValue(LocaleKeys.form_error_requiredField.tr())) {
      emit(state.copyWith(status: const BaseStatus.changed()));
      return;
    }
    final user = prefillFromCache(reinit: false);
    final currentPhone = phone.value;

    if (!currentPhone.isValid()) {
      emit(state.copyWith(
        status: const BaseStatus.failure(
            LocaleKeys.form_error_phoneNumber_invalidNumber),
      ));
      return;
    }
    // // Skip validation if phone number hasn't changed from user's current number
    // if (currentPhone.international == user.phoneNumber ||
    //     currentPhone.international.replaceAll('+', '') ==
    //         user.phoneNumber?.replaceAll('+', ''))

    if (currentPhone.international.replaceAll('+', '') ==
        user.phoneNumber?.replaceAll('+', '')) {
      emit(state.copyWith(
        phoneNumberIsExist: false,
        activeIndex: state.activeIndex + 1,
      ));
      getIt<AppCubit>().scrollTop();
      return;
    }

    if (state.isResubmitting) {
      emit(state.copyWith(
        phoneNumberIsExist: false,
        activeIndex: state.activeIndex + 1,
      ));
      getIt<AppCubit>().scrollTop();
      return;
    }
    final response = await verifyPhoneNumberUseCase(currentPhone.international);
    response.when(
      success: (exists) {
        if (!exists) {
          emit(state.copyWith(
            status: const BaseStatus.failure(
                LocaleKeys.snackbar_phoneNumberIsExist),
          ));
        } else {
          emit(state.copyWith(
            phoneNumberIsExist: false,
            activeIndex: state.activeIndex + 1,
          ));
          getIt<AppCubit>().scrollTop();
        }
      },
      failure: (error) {
        emit(state.copyWith(status: BaseStatus.failure(error)));
      },
    );
  }

  // -------------------- Upload Your Id -------------------- //

  void resetDocument() => emit(state.copyWith(document: null));

  String? validateDocument(value, String fieldKey) {
    if (value == null ||
        state.frontImage == null ||
        (state.document?.id == UserIdTypes.identityCard.intValue &&
            state.backImage == null)) {
      final field = LocalizedFieldExtension.fromKey(fieldKey);
      return LocalizedErrorType.requiredField.translate(field: field);
    }
    return null;
  }

  void setDocument(value) =>
      emit(state.copyWith(document: value, frontImage: null, backImage: null));

  void unSetImage(bool isBack) {
    emit(isBack
        ? state.copyWith(backImage: null)
        : state.copyWith(frontImage: null));
  }

  void setImage(XFile? imageFile, bool isBack) {
    emit(isBack
        ? state.copyWith(backImage: imageFile)
        : state.copyWith(frontImage: imageFile));
  }

  void validateUploadYourId() {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(activeIndex: state.activeIndex + 1));
      getIt<AppCubit>().scrollTop();
    }
  }

  // -------------------- Test Time -------------------- //

  void setVideo(XFile file) => emit(state.copyWith(video: file));
  void setVideoUrl(String url) =>
      emit(state.copyWith(videoUrl: url, isCheckedVideo: true));
  void setCheckBoxVideo(bool? value) =>
      emit(state.copyWith(isCheckedVideo: value!));
  void setCheckVidRecord(bool? value) =>
      emit(state.copyWith(isCheckedVidRecord: value ?? false));

  // -------------------- General Helpers -------------------- //

  final formKey = GlobalKey<FormState>();
  final errorMsg = {"isCheckedDate": ""};

  void setProgramId(int id) => emit(state.copyWith(programId: id));

  void checkAndSetErrorMsg(dynamic value, String fieldName) {
    if (value is bool) {
      errorMsg[fieldName] =
          value ? '' : LocaleKeys.form_error_requiredField.tr();
    }
  }

  void unSetErrorMsg() => errorMsg.updateAll((_, __) => '');

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.changed()));
  }

  void back(BuildContext context, {bool isVideoRejection = false}) {
    if (isVideoRejection || state.activeIndex <= 1) {
      context.router.pop();
      return;
    }

    emit(state.copyWith(activeIndex: state.activeIndex - 1));
    unSetErrorMsg();
  }

  // -------------------- Subscription -------------------- //

  Future<void> updatSubscribtion() async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    final images = <File>[];
    if (state.frontImage != null) {
      images.add(File(state.frontImage!.path));
    }
    if (state.backImage != null) {
      images.add(File(state.backImage!.path));
    }

    final useCase = ResubmitSubscriptionUseCase(
      subscriptionRepository: getIt(),
    );

    final response = await useCase.call(
      ResubmitSubscriptionRequest(
        subscriptionId: state.currentResubmittingSub!.id,
        firstName: firstName.text,
        lastName: lastName.text,
        userIdentityTypeId: state.document?.id,
        userIdentityFiles: images.map((f) => f.path).toList(),
        videoPath: state.video?.path,
      ),
    );

    response.when(
      success: (_) {
        final updatedSubscriptions = state.subscriptions.map((sub) {
          if (sub.id == state.subscriptions.first.id) {
            return sub.copyWith(status: SubscriptionStatus.pending);
          }
          return sub;
        }).toList();

        emit(state.copyWith(
          status: const BaseStatus.success(),
          subscriptions: updatedSubscriptions,
          isResubmitting: false,
          showSuccessDialog: true,
        ));
      },
      failure: (error) {
        emit(state.copyWith(status: const BaseStatus.failure()));
      },
    );

    return;
  }

  void subscribe({int? recieverId, int? dayId, int? timeId}) async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final images = <File>[];
    if (state.frontImage != null) {
      images.add(File(state.frontImage!.path));
    }
    if (state.backImage != null) {
      images.add(File(state.backImage!.path));
    }
    final isAr = getIt<AppPreferences>().isAr;
    final response = await studentSubscriptionUseCase.call(
      StudentSubscriptionRequest(
        programId: state.programId,
        firstName: firstName.text,
        middleName: middleName.text,
        lastName: lastName.text,
        genderId: gender!.id,
        dateOfBirth: AppDate.appToBEDate(dateOfBirth.text),
        nationalityId: nationality!.id,
        mainLanguageId: mainLanguage!.id,
        phoneNumber: phone.value.international,
        placeOfResidenceId: country!.id,
        identityTypeId: state.document?.id ?? 0,
        otherLanguagesIds:
            learningLanguages.map((e) => e.id.toString()).toList(),
        recitationId: recitation!.id,
        images: images,
        video: state.video != null ? File(state.video!.path) : null,
        evaluationMethod: state.evaluationMethod,
        preferredLanguage: isAr ? 'ar' : 'en',
        recieverId: recieverId ?? state.recieverId,
        dayId: dayId ?? state.dayId,
        timeId: timeId ?? state.timeId,
        suggestionTime: suggestionTime.text.isNotEmpty
            ? suggestionTime.text
            : state.suggestionTime,
      ),
      (sent, total) {
        emit(state.copyWith(sentBytes: sent, totalBytes: total));
      },
    );
    response.when(
      success: (response) async {
        AnalyticsService.instance.logEvent(
          'course_enrolled',
          parameters: {
            'program': Programs.values[state.programId],
            'student_id': getIt<AppPreferences>().getUserCachedResponse().id,
          },
        );
        getIt<AppPreferences>().setAccessToken(response.token);

        final fetchResponse =
            await studentSubscriptionUseCase.getMySubscriptions();
        fetchResponse.when(
          success: (list) async {
            emit(state.copyWith(
              status: const BaseStatus.success(),
              subscriptions: list,
              totalBytes: -1,
              sentBytes: 0,
              whatsAppUrl: response.whatsAppUrl,
              showSuccessDialog: true,
            ));
            if (response.whatsAppUrl != '' && state.evaluationMethod == 2) {
              final uri = Uri.parse(response.whatsAppUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                debugPrint('Could not launch ${response.whatsAppUrl}');
              }
            }
          },
          failure: (_) {
            emit(state.copyWith(
              status: const BaseStatus.success(),
              totalBytes: -1,
              sentBytes: 0,
              showSuccessDialog: true,
            ));
          },
        );
      },
      failure: (error) {
        emit(state.copyWith(
          status: const BaseStatus.failure(),
          totalBytes: -1,
          sentBytes: 0,
        ));
      },
    );
  }

  Future<void> loadSubscriptions() async {
    emit(state.copyWith(status: const BaseStatus.loading()));

    final response = await studentSubscriptionUseCase.getMySubscriptions();
    response.when(
      success: (list) {
        emit(state.copyWith(
          subscriptions: list,
          status: const BaseStatus.success(),
        ));
      },
      failure: (error) {
        emit(
          state.copyWith(status: BaseStatus.failure(error)),
        );
      },
    );
  }

  void clearImages() {
    emit(state.copyWith(
      frontImage: null,
      backImage: null,
    ));
  }

  void resetSuccessDialog() {
    emit(state.copyWith(showSuccessDialog: false));
  }

  // -------------------- Prefill from User Info -------------------- //
  void initializeFromUserInfo(UserInfo? userInfo) {
    if (userInfo == null) return;
    firstName.text = userInfo.firstName;
    middleName.text = userInfo.middleName ?? '';
    lastName.text = userInfo.lastName;
    dateOfBirth.text = userInfo.dateOfBirth.isNotEmpty
        ? AppDate.beToAppDate(userInfo.dateOfBirth)
        : '';
    setGender(userInfo.gender != null
        ? BaseField(id: userInfo.gender!.index + 1, name: userInfo.gender!.name)
        : null);

    setNationality(userInfo.nationality != null
        ? BaseField(
            id: userInfo.nationality!.id,
            name: userInfo.nationality!.name,
          )
        : null);

    setMainLanguage(userInfo.mainLanguage != null
        ? BaseField(
            id: userInfo.mainLanguage!.index + 1,
            name: userInfo.mainLanguage!.name,
          )
        : null);

    // Convert to BaseField and remove duplicates based on id
    final learningLanguagesMap = <int, BaseField>{};
    for (var lang in userInfo.learningLanguages) {
      final baseField = BaseField(id: lang.index + 1, name: lang.name);
      learningLanguagesMap[baseField.id] = baseField;
    }
    setLearningLanguages(learningLanguagesMap.values.toList());

    setCountryLanguage(userInfo.placeOfResidence != null
        ? BaseField(
            id: userInfo.placeOfResidence!.id,
            name: userInfo.placeOfResidence!.name,
          )
        : null);

    setRecitation(userInfo.subscriptionStatus != null
        ? BaseField(
            id: userInfo.subscriptionStatus!.intValue,
            name: userInfo.subscriptionStatus!.name,
          )
        : null);
    if (userInfo.subscriptionStatus != null) {
      emit(state.copyWith(activeIndex: 1));
    }
    setGender(userInfo.gender != null
        ? BaseField(id: userInfo.gender!.index + 1, name: userInfo.gender!.name)
        : null);
    setRecitation(userInfo.studentRecitations.isNotEmpty
        ? userInfo.studentRecitations.first.recitation
        : null);
  }

  UserInfo prefillFromCache({bool reinit = true}) {
    try {
      final userInfo = userCubit.state.userInfo ??
          getIt<AppPreferences>().getUserCachedResponse();
      if (reinit) {
        initializeFromUserInfo(userInfo);
      }

      return userInfo;
    } catch (e) {
      throw Exception(e);
    }
  }
  // -------------------- Lifecycle -------------------- //

  @override
  Future<void> close() {
    firstName.dispose();
    middleName.dispose();
    lastName.dispose();
    dateOfBirth.dispose();
    phone.dispose();
    return super.close();
  }

//------------------------Document + video--------------------//

  Future<Uint8List?> downloadFileFromUrl(String url) async {
    try {
      final dio = Dio(DioConstants.defaultOptions)
        ..interceptors.addAll(DioConstants.defaultInterceptors);

      final resp = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      if (resp.statusCode == 200 && resp.data != null) {
        return Uint8List.fromList(resp.data);
      }
    } catch (e, st) {
      print('downloadFileFromUrl error: $e\n$st');
    }
    return null;
  }

  Future<XFile>? saveBytesToTempFile(Uint8List bytes, String filename) async {
    final dir = await getTemporaryDirectory();
    final safeName = filename.replaceAll(RegExp(r'[^\w\.\-]'), '_');
    final file = File('${dir.path}/$safeName');
    await file.writeAsBytes(bytes, flush: true);
    return XFile(file.path);
  }

  bool canEditField(String fieldName) {
    if (state.isResubmitting) {
      return fieldName == 'firstName' ||
          fieldName == 'lastName' ||
          fieldName == 'document' ||
          fieldName == 'video';
    }
    return true;
  }

  void setEvaluationMethod(int method) {
    emit(state.copyWith(evaluationMethod: method));
  }

  void setCurrentResubmittingSub(SubscriptionModel? sub) {
    emit(state.copyWith(currentResubmittingSub: sub));
  }

  void setScheduleDetails({
    required int recieverId,
    int? dayId,
    int? timeId,
    String? suggestionTime,
  }) {
    emit(state.copyWith(
      recieverId: recieverId,
      dayId: dayId,
      timeId: timeId,
      suggestionTime: suggestionTime,
    ));
  }
}
