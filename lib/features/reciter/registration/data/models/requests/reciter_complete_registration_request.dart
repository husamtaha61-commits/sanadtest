import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'reciter_available_times_request.dart';

class RectierCompleteRegistrationRequest {
  final XFile profileImage;
  final XFile? video;
  final String password;
  final String confirmPassword;
  final String resetToken;
  final String? iban;
  final String? swiftCode;
  final String? bankName;
  final String? paypalAccountNumber;
  final String? westernUploadedId;
  final int? paymentTypeId;
  final List<ReciterAvailableTimesRequest> recitersAvailableTimes;
  final String? description;

  RectierCompleteRegistrationRequest({
    required this.profileImage,
    required this.video,
    required this.password,
    required this.confirmPassword,
    required this.resetToken,
    required this.iban,
    required this.swiftCode,
    required this.bankName,
    required this.paypalAccountNumber,
    required this.westernUploadedId,
    required this.paymentTypeId,
    required this.recitersAvailableTimes,
    required this.description,
  });

  Future<FormData> toFormData() async {
    final availableTimes = [];

    final formData = FormData.fromMap({
      'ProfileImage': await MultipartFile.fromFile(profileImage.path),
      'Video': video != null ? await MultipartFile.fromFile(video!.path) : null,
      'ResetPasswordInfo.Password': password,
      'ResetPasswordInfo.ConfirmPassword': confirmPassword,
      'ResetPasswordInfo.ResetToken': resetToken,
      'BankInfo.IBan': iban,
      'BankInfo.SwiftCode': swiftCode,
      'BankInfo.BankName': bankName,
      'PayPalAccountNumber': paypalAccountNumber,
      'WesternUploadedId': westernUploadedId,
      'PaymentTypeId': paymentTypeId,
      'RecitersAvailableTime': availableTimes,
      "Description": description,
    });

    for (var i = 0; i < recitersAvailableTimes.length; i++) {
      formData.fields.add(
        MapEntry(
          'RecitersAvailableTime[$i].dayId',
          recitersAvailableTimes[i].dayId.toString(),
        ),
      );
      for (var j = 0; j < recitersAvailableTimes[i].hoursIds.length; j++) {
        formData.fields.add(
          MapEntry(
            'RecitersAvailableTime[$i].hoursIds[$j]',
            recitersAvailableTimes[i].hoursIds[j].toString(),
          ),
        );
      }
    }
    return formData;
  }
}
