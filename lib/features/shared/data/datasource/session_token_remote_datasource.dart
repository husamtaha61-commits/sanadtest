import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';

abstract class SessionTokenRemoteDatasource {
  Future<ApiResult> addSessionToken(String id);
}

@LazySingleton(as: SessionTokenRemoteDatasource)
class SessionTokenDatasourceImp implements SessionTokenRemoteDatasource {
  final RetrofitClient retrofitClient;

  SessionTokenDatasourceImp({required this.retrofitClient});

  @override
  Future<ApiResult> addSessionToken(String id) {
    return apiHandler(
      () => retrofitClient.addSessionToken(id),
    );
  }
}
