import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/retrofit_client.dart';
import '../../../../core/responses/base_pagination_response.dart';
import '../../../student/rescheduling/data/models/responses/my_schedule_response.dart';
import '../models/requests/announcement_request.dart';
import '../models/requests/my_sessions_request.dart';
import '../models/requests/slider_request.dart';
import '../models/responses/announcement_response.dart';
import '../models/responses/currently_session_response.dart';
import '../models/responses/global_connection_reciter_response.dart';
import '../models/responses/home_section_response.dart';
import '../models/responses/program_response.dart';
import '../models/responses/reciter_student_response.dart';
import '../models/responses/sanad_course_response.dart';
import '../models/responses/slider_response.dart';
import '../models/responses/student_progress_response.dart';
import '../models/responses/wordpress_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<List<ProgramResponse>>> getAllPrograms();

  Future<ApiResult<List<SessionResponse>>> getMySessions(
      MySessionsRequest mySessionsRequest);

  Future<ApiResult<List<CurrentlySessionResponse>>> getMyCurrentlySessions();

  Future<ApiResult<BasePaginationResponse<SliderResponse>>> getSlider(
      SliderRequest sliderRequest);

  Future<ApiResult<GlobalRecitersSectionResponse>> getGlobalRecitersSection();

  Future<ApiResult<BasePaginationResponse<AnnouncementResponse>>>
      getAnnouncements(AnnouncementRequest announcementRequest);

  Future<ApiResult<StudentProgressResponse>> getStudentProgress(int studentId);

  Future<ApiResult<List<ReciterStudentResponse>>> getReciterStudents();
  Future<ApiResult<String>> getSanadMinhajURL();

  Future<ApiResult<List<SanadCourseResponse>>> getSanadMinhajProgress();

  Future<ApiResult<List<HomeSectionResponse>>> getAllHomeSectionsForStudent();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final RetrofitClient retrofitClient;

  HomeRemoteDataSourceImp({required this.retrofitClient});

  @override
  Future<ApiResult<List<ProgramResponse>>> getAllPrograms() {
    return apiHandler<List<ProgramResponse>>(
      () => retrofitClient.getAllPrograms(),
    );
  }

  @override
  Future<ApiResult<List<SessionResponse>>> getMySessions(
      MySessionsRequest mySessionsRequest) {
    return apiHandler<List<SessionResponse>>(
      () => retrofitClient.getMySessions(
        mySessionsRequest.dateStart,
        mySessionsRequest.dateLimit,
      ),
    );
  }

  @override
  Future<ApiResult<List<CurrentlySessionResponse>>> getMyCurrentlySessions() {
    return apiHandler<List<CurrentlySessionResponse>>(
      () => retrofitClient.getMyCurrentlySessions(),
    );
  }

  @override
  Future<ApiResult<BasePaginationResponse<SliderResponse>>> getSlider(
      SliderRequest sliderRequest) {
    return apiHandler<BasePaginationResponse<SliderResponse>>(
      () => retrofitClient.getSlider(sliderRequest.isDisabled),
    );
  }

  @override
  Future<ApiResult<GlobalRecitersSectionResponse>> getGlobalRecitersSection() {
    return apiHandler<GlobalRecitersSectionResponse>(
      () => retrofitClient.getGlobalRecitersSection(),
    );
  }

  @override
  Future<ApiResult<BasePaginationResponse<AnnouncementResponse>>>
      getAnnouncements(AnnouncementRequest announcementRequest) {
    return apiHandler<BasePaginationResponse<AnnouncementResponse>>(
      () => retrofitClient.getAnnouncements(announcementRequest.isActive),
    );
  }

  @override
  Future<ApiResult<StudentProgressResponse>> getStudentProgress(int studentId) {
    return apiHandler<StudentProgressResponse>(
      () => retrofitClient.getStudentProgress(studentId),
    );
  }

  @override
  Future<ApiResult<List<ReciterStudentResponse>>> getReciterStudents() {
    return apiHandler<List<ReciterStudentResponse>>(
      () => retrofitClient.getReciterStudents(),
    );
  }

  @override
  Future<ApiResult<String>> getSanadMinhajURL() async {
    return await apiHandler<String>(() async {
      final WordPressResponse resp = await retrofitClient.getSanadMinhajURL();
      final raw = resp.url;
      final urlTrimmed = raw.trim();

      if (urlTrimmed.isEmpty) {
        throw Exception('Empty URL in response');
      }
      final uri = Uri.tryParse(urlTrimmed);
      final safeUrl =
          (uri != null && uri.hasScheme) ? urlTrimmed : 'https://$urlTrimmed';
      return ApiResponse<String>(data: safeUrl);
    });
  }

  @override
  Future<ApiResult<List<SanadCourseResponse>>> getSanadMinhajProgress() {
    return apiHandler<List<SanadCourseResponse>>(
      () => retrofitClient.getSanadMinhajProgress(),
    );
  }

  @override
  Future<ApiResult<List<HomeSectionResponse>>> getAllHomeSectionsForStudent() {
    return apiHandler<List<HomeSectionResponse>>(
      () => retrofitClient.getAllHomeSectionsForStudent(),
    );
  }
}
