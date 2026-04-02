import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../domain/repositories/session_token_repository.dart';

import '../datasource/session_token_remote_datasource.dart';

@LazySingleton(as: SessionTokenRepository)
class SessionTokenRepositoryImpl implements SessionTokenRepository {
  final SessionTokenRemoteDatasource sessionTokenRemoteDatasource;

  SessionTokenRepositoryImpl({required this.sessionTokenRemoteDatasource});

  @override
  Future<ApiResult> addSessionToken(String id) async {
    return await sessionTokenRemoteDatasource.addSessionToken(id);
  }
}
