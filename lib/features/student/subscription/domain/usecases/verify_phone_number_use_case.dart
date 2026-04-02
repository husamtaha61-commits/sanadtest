
import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../repositories/subscription_repository.dart';

@lazySingleton
class VerifyPhoneNumberUseCase {
  final SubscriptionRepository subscriptionRepository;


  VerifyPhoneNumberUseCase({required this.subscriptionRepository});

  Future<ApiResult<bool>> call(String phoneNumber) async {
    return await subscriptionRepository.verifyPhoneNumber(phoneNumber);
  }
}
