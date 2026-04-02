import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';

import '../repositories/messaging_repository.dart';

@lazySingleton
class GetMessagingContactsUseCase {
  final MessagingRepository messagingRepository;

  GetMessagingContactsUseCase({required this.messagingRepository});

  Future<ApiResult> call() async {
    return await messagingRepository.getMessagingContacts();
  }
}
