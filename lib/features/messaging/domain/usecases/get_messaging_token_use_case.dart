import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../repositories/messaging_repository.dart';

@lazySingleton
class GetMessagingTokenUseCase {
  final MessagingRepository messagingRepository;

  GetMessagingTokenUseCase({required this.messagingRepository});

  Future<ApiResult<String>> call() async {
    return await messagingRepository.getMessagingToken();
  }
}
