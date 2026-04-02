import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/requests/user_send_otp_request.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SendOtpUseCase {
  final AuthRepository authRepository;

  SendOtpUseCase({required this.authRepository});

  Future<ApiResult> call(UserSendOtpRequest userSendOtpRequest) async {
    return await authRepository.sendOtp(userSendOtpRequest);
  }
}
