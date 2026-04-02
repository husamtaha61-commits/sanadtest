import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../data/models/responses/get_random_quran_response.dart';
import '../repositories/subscription_repository.dart';

@lazySingleton
class GetRandomQuranUseCase {
  final SubscriptionRepository subscriptionRepository;

  GetRandomQuranUseCase({required this.subscriptionRepository});

  Future<ApiResult<GetRandomQuranResponse>> call() async {
    return await subscriptionRepository.getRandomQuran();
  }
}
