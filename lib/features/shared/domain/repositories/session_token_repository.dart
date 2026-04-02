import '../../../../../core/network/api_response.dart';

abstract class SessionTokenRepository {
  Future<ApiResult> addSessionToken(String id);
}
