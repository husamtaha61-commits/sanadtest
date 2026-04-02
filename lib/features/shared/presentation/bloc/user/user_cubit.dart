import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/entities/base_field.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/models/base_status.dart';
import '../../../../../core/services/analytics_service.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../../../../core/utils/app_date.dart';
import '../../../data/models/requests/user_device_token_request.dart';
import '../../../data/models/requests/user_settings_request.dart';
import '../../../domain/entites/user_info.dart';
import '../../../domain/entites/user_role.dart';
import '../../../domain/usecases/add_device_token_use_case.dart';
import '../../../domain/usecases/get_user_info_usecase.dart';
import '../../../domain/usecases/update_user_settings_use_case.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final AppPreferences appPreferences;

  final GetUserInfoUseCase _getUserInfoUseCase;
  final AddDeviceTokenUseCase _addDeviceTokenUseCase;
  final UpdateUserSettingsUseCase _updateUserSettingsUseCase;
  UserCubit(
    this.appPreferences,
    this._getUserInfoUseCase,
    this._addDeviceTokenUseCase,
    this._updateUserSettingsUseCase,
  ) : super(const UserState());

  Future<void> getUserInfo([int? userId]) async {
    if (state.status == const BaseStatus.loading()) {
      return;
    }

    emit(state.copyWith(status: const BaseStatus.loading()));
    final response = await _getUserInfoUseCase(userId);
    response.when(
      success: (userInfoResponse) {
        appPreferences.cacheUserResponse(userInfoResponse);
        emit(
          state.copyWith(
            status: const BaseStatus.success(),
            id: userInfoResponse.id,
            firstName: userInfoResponse.firstName,
            middleName: userInfoResponse.middleName ?? '',
            lastName: userInfoResponse.lastName,
            dateOfBirth: AppDate.beToAppDate(userInfoResponse.dateOfBirth),
            hasActiveSchedule: userInfoResponse.hasActiveSchedule,
            isVerified: userInfoResponse.isVerified,
            isLoginCompleted: userInfoResponse.isLoginCompleted,
            email: userInfoResponse.email,
            role: (userInfoResponse.roles.isNotEmpty)
                ? userInfoResponse.roles[0]
                : null,
            phoneNumber: userInfoResponse.phoneNumber,
            mainLanguage: userInfoResponse.mainLanguage,
            learningLanguages: userInfoResponse.learningLanguages,
            description: userInfoResponse.description,
            profileImageUrl: userInfoResponse.profileImageUrl,
            introVideoUrl: userInfoResponse.introVideoUrl,
            placeOfResidence: userInfoResponse.placeOfResidence,
            nationality: userInfoResponse.nationality,
            gender: userInfoResponse.gender,
            subscriptionStatus: userInfoResponse.subscriptionStatus,
            userStatus: userInfoResponse.userStatus,
            appLang: userInfoResponse.appLang,
            userIdentities: userInfoResponse.userIdentities,
            studentRecitations: userInfoResponse.studentRecitations,
            userInfo: userInfoResponse,
          ),
        );
      },
      failure: (error) {
        if (getIt<AppPreferences>().isLoggedIn()) {
          final userInfoResponse = appPreferences.getUserCachedResponse();
          emit(
            state.copyWith(
              status: const BaseStatus.success(),
              userInfo: userInfoResponse,
              id: userInfoResponse.id,
              firstName: userInfoResponse.firstName,
              middleName: userInfoResponse.middleName ?? '',
              lastName: userInfoResponse.lastName,
              dateOfBirth: AppDate.beToAppDate(userInfoResponse.dateOfBirth),
              hasActiveSchedule: userInfoResponse.hasActiveSchedule,
              isVerified: userInfoResponse.isVerified,
              isLoginCompleted: userInfoResponse.isLoginCompleted,
              email: userInfoResponse.email,
              role: (userInfoResponse.roles.isNotEmpty)
                  ? userInfoResponse.roles[0]
                  : null,
              phoneNumber: userInfoResponse.phoneNumber,
              mainLanguage: userInfoResponse.mainLanguage,
              learningLanguages: userInfoResponse.learningLanguages,
              description: userInfoResponse.description,
              profileImageUrl: userInfoResponse.profileImageUrl,
              introVideoUrl: userInfoResponse.introVideoUrl,
              placeOfResidence: userInfoResponse.placeOfResidence,
              nationality: userInfoResponse.nationality,
              gender: userInfoResponse.gender,
              subscriptionStatus: userInfoResponse.subscriptionStatus,
              userStatus: userInfoResponse.userStatus,
              appLang: userInfoResponse.appLang,
              userIdentities: userInfoResponse.userIdentities,
              studentRecitations: userInfoResponse.studentRecitations,
            ),
          );
        } else {
          emit(state.copyWith(status: const BaseStatus.failure()));
        }
      },
    );
  }

  void addDeviceToken(UserDeviceTokenRequest userDeviceTokenRequest) async {
    _addDeviceTokenUseCase(userDeviceTokenRequest);
  }

  void updateUserSettings() async {
    final result = await _updateUserSettingsUseCase(
      UserSettingsRequest(appLang: getIt<AppPreferences>().getLang),
    );
    result.when(
      success: (data) {
        AnalyticsService.instance.logProfileUpdate();
      },
      failure: (error) {},
    );
  }

  /// ------------------ Document & Video Caching ------------------ ///

  Future<XFile?> downloadAndCacheFile(String url, {String? fileName}) async {
    try {
      if (url.isEmpty) return null;

      final dio = Dio();
      final name = fileName ?? url.split('/').last;
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$name';

      final response = await dio.get<List<int>>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );

      final file = File(filePath);
      await file.writeAsBytes(response.data!);

      return XFile(filePath, name: name);
    } catch (e) {
      return null;
    }
  }

  Future<void> cacheUserIdentityFiles() async {
    final identities = state.userInfo?.userIdentities ?? [];
    if (identities.isEmpty) return;

    final List<XFile> files = [];
    for (var identity in identities) {
      final url = identity.fileStorageId ?? '';
      if (url.isEmpty) continue;

      final cachedFile =
          await downloadAndCacheFile(url, fileName: identity.fileName);
      if (cachedFile != null) files.add(cachedFile);
    }

    emit(state.copyWith(userIdentityFiles: files));
  }

  Future<void> cacheIntroVideo() async {
    final url = state.userInfo?.introVideoUrl ?? '';
    if (url.isEmpty) return;

    final cachedVideo =
        await downloadAndCacheFile(url, fileName: 'intro_video.mp4');
    if (cachedVideo != null) emit(state.copyWith(videoFile: cachedVideo));
  }

  Future<void> cacheAllMedia() async {
    await cacheUserIdentityFiles();
    await cacheIntroVideo();
  }
}
