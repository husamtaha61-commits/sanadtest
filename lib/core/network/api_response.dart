import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../gen/translations/locale_keys.g.dart';
import '../di/injection.dart';
import '../services/app_lifecycle_service.dart';

part 'api_response.g.dart';
part 'api_response.freezed.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApiResponse<T> {
  final T data;

  ApiResponse({required this.data});

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class ErrorResponse {
  final String? errorMessage;

  ErrorResponse({required this.errorMessage});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(String error) = Failure;
}

Future<ApiResult<T>> apiHandler<T>(
    Future<dynamic> Function() restApiCall) async {
  if (!AppLifecycleService.instance.isAppActive) {
    return ApiResult.failure('App is in background, skipping API call');
  }
  try {
    final dynamic apiResponse = await restApiCall();

    if (apiResponse is String) {
      final Map<String, dynamic> jsonMap = jsonDecode(apiResponse);
      if (jsonMap.containsKey('data')) {
        return ApiResult.success(jsonMap['data'] as T);
      } else {
        return ApiResult.success(jsonMap as T);
      }
    } else if (apiResponse is ApiResponse<T>) {
      return ApiResult.success(apiResponse.data);
    }

    throw Exception('Unexpected response type: ${apiResponse.runtimeType}');
  } on DioException catch (e) {
    final errorMsg = extractErrorMsg(e);
    handleApiErrorLogging(
      e,
      'DioException occurred in API handler, url: ${e.requestOptions.uri}, errorResponseDetails: $errorMsg',
      e.stackTrace,
    );
    return ApiResult.failure(errorMsg);
  } catch (e, stackTrace) {
    handleApiErrorLogging(
      e,
      'Unexpected error occurred in API handler',
      stackTrace,
    );
    return ApiResult.failure(LocaleKeys.apiError_server.tr());
  }
}

void handleApiErrorLogging(Object error, String reason,
    [StackTrace? stackTrace]) {
  if (!kReleaseMode) {
    log(error.toString());
  } else {
    getIt<FirebaseCrashlytics>().recordError(
      error,
      stackTrace,
      reason: reason,
      fatal: true,
    );
  }
}

String extractErrorMsg(DioException error) {
  late String errorMsg;
  if (error.type == DioExceptionType.connectionError) {
    errorMsg = LocaleKeys.apiError_connection.tr();
  } else {
    errorMsg = ErrorResponse.fromJson(
          error.response?.data is Map<String, dynamic>
              ? error.response?.data
              : {},
        ).errorMessage ??
        LocaleKeys.apiError_server.tr();
  }
  return errorMsg;
}
