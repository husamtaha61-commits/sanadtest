import '../../../../core/network/api_response.dart';
import '../entities/messaging_contact.dart';

abstract class MessagingRepository {
  Future<ApiResult<List<MessagingContact>>> getMessagingContacts();
  Future<ApiResult<String>> getMessagingToken();
}
