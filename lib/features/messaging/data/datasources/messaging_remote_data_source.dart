import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../core/network/retrofit_client.dart';
import '../../../../core/network/api_response.dart';
import '../models/responses/messaging_contact_response.dart';

abstract class MessagingRemoteDataSource {
  Future<ApiResult<List<MessagingContactResponse>>> getMessagingContacts();

  Future<ApiResult<String>> getMessagingToken();
}

@LazySingleton(as: MessagingRemoteDataSource)
class MessagingRemoteDataSourceImp implements MessagingRemoteDataSource {
  final RetrofitClient retrofitClient;

  MessagingRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<List<MessagingContactResponse>>> getMessagingContacts() {
    return apiHandler<List<MessagingContactResponse>>(
      () => retrofitClient.getMessagingContacts(),
    );
  }

  @override
  Future<ApiResult<String>> getMessagingToken() {
    return apiHandler<String>(
      () => retrofitClient.getMessagingToken(Platform.isIOS),
    );
  }
}
