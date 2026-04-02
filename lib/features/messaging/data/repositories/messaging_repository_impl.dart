import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';

import '../../domain/entities/messaging_contact.dart';
import '../../domain/repositories/messaging_repository.dart';
import '../datasources/messaging_remote_data_source.dart';

@LazySingleton(as: MessagingRepository)
class MessagingRepositoryImpl implements MessagingRepository {
  final MessagingRemoteDataSource messagingRemoteDataSource;

  MessagingRepositoryImpl({required this.messagingRemoteDataSource});

  @override
  Future<ApiResult<List<MessagingContact>>> getMessagingContacts() async {
    final result = await messagingRemoteDataSource.getMessagingContacts();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((contact) => MessagingContact.fromResponse(contact))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<String>> getMessagingToken() async {
    return await messagingRemoteDataSource.getMessagingToken();
  }
}
