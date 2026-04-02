import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/analytics_service.dart';
import '../../../../../../core/utils/admin_config_manager.dart';
import '../../../data/models/requests/reciter_available_times_request.dart';
import '../../../data/models/requests/reciter_complete_registration_request.dart';
import '../../../domain/usecases/reciter_complete_registration_use_case.dart';

import '../../../../../../core/bloc/app/app_cubit.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../core/models/base_status.dart';
import '../../../../../../gen/translations/locale_keys.g.dart';

part 'reciter_complete_profile_state.dart';
part 'reciter_complete_profile_cubit.freezed.dart';

@injectable
class ReciterCompleteProfileCubit extends Cubit<ReciterCompleteProfileState> {
  final ReciterCompleteRegistrationUseCase reciterCompleteRegistrationUseCase;
  ReciterCompleteProfileCubit(this.reciterCompleteRegistrationUseCase)
      : super(const ReciterCompleteProfileState());

  //S--------------------Personal Info--------------------S//

  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final description = TextEditingController();

  void validatePersonalInfo() {
    setAndCheckErrorMsg(state.isChecked1, 'isChecked1');
    setAndCheckErrorMsg(state.isChecked2, 'isChecked2');
    setAndCheckErrorMsg(state.profilePicture != null, 'profilePicture');

    if (formKey.currentState!.validate() &&
        !errorMsg.containsValue(LocaleKeys.form_error_requiredField.tr())) {
      emit(state.copyWith(activeIndex: state.activeIndex + 1));
      getIt<AppCubit>().scrollTop();
    }
  }

  void setCheckbox1(bool? value) => emit(state.copyWith(isChecked1: value!));
  void setCheckbox2(bool? value) => emit(state.copyWith(isChecked2: value!));
  void setImage(XFile fileImage) =>
      emit(state.copyWith(profilePicture: fileImage));

  //E--------------------Personal Info--------------------E//

  //S------------------Introductory Video------------------S//

  void validateIntroductoryVideo() {
    setAndCheckErrorMsg(state.video != null, 'video');
    if (!errorMsg.containsValue(LocaleKeys.form_error_requiredField.tr())) {
      emit(state.copyWith(activeIndex: state.activeIndex + 1));
      getIt<AppCubit>().scrollTop();
    }
  }

  void setVideo(XFile file) => emit(state.copyWith(video: file));

  void skipIntroductoryVideo() {
    emit(
      state.copyWith(
        activeIndex: state.activeIndex + 1,
        video: null,
      ),
    );
    getIt<AppCubit>().scrollTop();
    unSetErrorMsg();
  }

  //E------------------Introductory Video------------------E//

  //S------------------Payment Information------------------S//

  final iban = TextEditingController();
  final swiftCode = TextEditingController();
  final bankName = TextEditingController();
  final payPal = TextEditingController();
  final westrenUnion = TextEditingController();

  void clearPaymentControllers() {
    iban.text = '';
    swiftCode.text = '';
    bankName.text = '';
    payPal.text = '';
    westrenUnion.text = '';
  }

  void validatePaymentInformation() {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(activeIndex: state.activeIndex + 1));
      getIt<AppCubit>().scrollTop();
    }
  }

  void updatePaymnetId(int id) {
    clearPaymentControllers();
    emit(state.copyWith(paymentTypeId: id));
  }

  void skipPaymentInformation() {
    clearPaymentControllers();
    emit(
      state.copyWith(
        activeIndex: state.activeIndex + 1,
        bankIban: null,
        bankSwiftCode: null,
        bankName: null,
        payPalAccountNumber: null,
        westernUploadedId: null,
      ),
    );
    getIt<AppCubit>().scrollTop();
  }

  //E------------------Payment Information------------------E//

  //S------------------Available Times------------------S//

  var reciterAvailableTimesSelectedNum = 0;

  void pickTime(int dayId, int timeId) {
    final List<ReciterAvailableTimesRequest> availableTimes =
        List.from(state.reciterAvailableTimes);

    final index = availableTimes.indexWhere((item) => item.dayId == dayId);

    if (index != -1) {
      final item = availableTimes[index];
      List<int> hours = List.from(item.hoursIds);

      if (hours.contains(timeId)) {
        hours.remove(timeId);
        reciterAvailableTimesSelectedNum--;
      } else {
        hours.add(timeId);
        reciterAvailableTimesSelectedNum++;
      }

      availableTimes[index] = item.copyWith(hoursIds: hours);
    } else {
      availableTimes
          .add(ReciterAvailableTimesRequest(dayId: dayId, hoursIds: [timeId]));
      reciterAvailableTimesSelectedNum++;
    }

    emit(state.copyWith(reciterAvailableTimes: availableTimes));
  }

  void submit(String resetToken) async {
    if (formKey.currentState!.validate()) {
      if (!AdminConfigManager.isReciterSessionCountValid(
          reciterAvailableTimesSelectedNum)) {
        withStateEmission(() {
          errorMsg['availableTimes'] = LocaleKeys
              .form_error_availableTimes_reciterMinmumAvailableTimes
              .tr(args: [
            AdminConfigManager.getAdminConfig()
                .minNumOfAvaialableTimes
                .toString()
          ]);
        });
      } else {
        emit(state.copyWith(status: const BaseStatus.loading()));
        final response = await reciterCompleteRegistrationUseCase.call(
          RectierCompleteRegistrationRequest(
            resetToken: resetToken,
            password: password.text,
            confirmPassword: confirmPassword.text,
            description: description.text,
            profileImage: state.profilePicture!,
            video: state.video,
            iban: iban.text,
            swiftCode: swiftCode.text,
            bankName: bankName.text,
            paypalAccountNumber: payPal.text,
            westernUploadedId: westrenUnion.text,
            paymentTypeId: state.paymentTypeId,
            recitersAvailableTimes: state.reciterAvailableTimes,
          ),
        );

        response.when(
          success: (data) {
            emit(state.copyWith(status: const BaseStatus.success()));

            // Log profile completion event
            AnalyticsService.instance.logEvent(
              'profile_completed',
              parameters: {
                'has_video': state.video != null,
              },
            );
          },
          failure: (error) =>
              emit(state.copyWith(status: const BaseStatus.failure())),
        );
      }
    }
  }

  //E------------------Available Times------------------E//

  final formKey = GlobalKey<FormState>();

  final errorMsg = {
    "isChecked1": '',
    "isChecked2": '',
    'profilePicture': '',
    'video': '',
    'availableTimes': '',
  };

  void setAndCheckErrorMsg(dynamic value, String fieldName) {
    withStateEmission(() {
      bool isRequired = true;

      if (value.runtimeType == bool && value) {
        isRequired = false;
      } else if (value.runtimeType == String && value.isNotEmpty) {
        isRequired = false;
      }

      errorMsg[fieldName] =
          isRequired ? LocaleKeys.form_error_requiredField.tr() : '';
    });
  }

  void unSetErrorMsg() {
    errorMsg.forEach((key, value) {
      errorMsg[key] = '';
    });
  }

  void withStateEmission(VoidCallback callback) {
    emit(state.copyWith(status: const BaseStatus.initial()));
    callback();
    emit(state.copyWith(status: const BaseStatus.changed()));
  }

  void back() {
    unSetErrorMsg();
    emit(state.copyWith(activeIndex: state.activeIndex - 1));
  }
}
