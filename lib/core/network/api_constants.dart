import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../gen/translations/locale_keys.g.dart';
import '../bloc/data/data_cubit.dart';
import '../config/app_config.dart';
import '../di/injection.dart';
import '../extenstions/string.dart';
import '../services/app_preferences.dart';
import 'api_response.dart';

class DioConstants {
  static final String baseUrl = AppConfig.shared.baseUrl;

  static final BaseOptions defaultOptions = BaseOptions(
    baseUrl: DioConstants.baseUrl,
    headers: {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
    },
  );

  static const getFileByIdEndpoint = '/File/GetFileById';
  static const getVideoByIdEndpoint = '/File/GetVideoById';

  static List<Interceptor> defaultInterceptors = [
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final appPreferences = getIt<AppPreferences>();
        options.headers['Authorization'] =
            'Bearer ${appPreferences.accessToken.isNotEmpty ? appPreferences.accessToken : appPreferences.tempAccessToken}';
        options.headers['Lang'] = getIt<AppPreferences>().getLang;

        handler.next(options);
      },
      onError: (DioException error, handler) {
        if (error.type == DioExceptionType.connectionError) {
          debugPrint("Ignored connection error: ${error.message}");
          return handler.next(error);
        }

        if (error.response?.statusCode == 401) {
          triggerDataEvent(LocaleKeys.apiError_sessionExpired, true, 401);
        } else {
          final errorMsg = extractErrorMsg(error);
          triggerDataEvent(errorMsg, true);
        }

        return handler.next(error);
      },
    ),
    DioCacheInterceptor(
      options: CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
      ),
    ),
  ];

  static List<Interceptor> isolateInterceptors = [
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final accessToken = prefs.getString(PreferencesKey.token.name);

        options.headers['Authorization'] =
            'Bearer ${accessToken.isNotNullOrEmpty ? accessToken : prefs.getString(PreferencesKey.tempToken.name)}';
        options.headers['Lang'] = prefs.getString(PreferencesKey.lang.name);

        handler.next(options);
      },
    ),
  ];
}
