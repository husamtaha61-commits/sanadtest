import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_response.dart';

import '../../../student/rescheduling/domain/entites/session.dart';
import '../../domain/entites/announcement.dart';
import '../../domain/entites/currently_session.dart';
import '../../domain/entites/global_reciters_section.dart';
import '../../domain/entites/home_section.dart';
import '../../domain/entites/program.dart';
import '../../domain/entites/reciter_student.dart';
import '../../domain/entites/sanad_minhaj_progress.dart';
import '../../domain/entites/slider_content.dart';
import '../../domain/entites/student_progress.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/requests/announcement_request.dart';
import '../models/requests/my_sessions_request.dart';
import '../models/requests/slider_request.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<ApiResult<List<Program>>> getAllPrograms() async {
    final result = await homeRemoteDataSource.getAllPrograms();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((program) => Program.fromResponse(program))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<Session>>> getMySessions(
      MySessionsRequest mySessionsRequest) async {
    final result = await homeRemoteDataSource.getMySessions(mySessionsRequest);
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((sessionResponse) => Session.fromResponse(sessionResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<CurrentlySession>>> getMyCurrentlySessions() async {
    final result = await homeRemoteDataSource.getMyCurrentlySessions();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((currentlySessionResponse) =>
                CurrentlySession.fromResponse(currentlySessionResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) {
        return ApiResult.failure(error);
      },
    );
  }

  @override
  Future<ApiResult<List<SliderContent>>> getSlider(
      SliderRequest sliderRequest) async {
    final result = await homeRemoteDataSource.getSlider(sliderRequest);
    return result.when(
      success: (paginationResponse) {
        List<SliderContent> entityList = [];
        entityList = paginationResponse.data
            .map((sliderResponse) => SliderContent.fromResponse(sliderResponse))
            .toList();

        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<GlobalRecitersSection>> getGlobalRecitersSection() async {
    final result = await homeRemoteDataSource.getGlobalRecitersSection();
    return result.when(
      success: (response) {
        final entity = GlobalRecitersSection.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<Announcement>>> getAnnouncements(
      AnnouncementRequest announcementRequest) async {
    final result =
        await homeRemoteDataSource.getAnnouncements(announcementRequest);
    return result.when(
      success: (paginationResponse) {
        final entityList = paginationResponse.data
            .map((announcementResponse) =>
                Announcement.fromResponse(announcementResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<StudentProgress>> getStudentProgress(int studentId) async {
    final result = await homeRemoteDataSource.getStudentProgress(studentId);
    return result.when(
      success: (response) {
        final entity = StudentProgress.fromResponse(response);
        return ApiResult.success(entity);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<ReciterStudent>>> getReciterStudents() async {
    final result = await homeRemoteDataSource.getReciterStudents();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((reciterStudentResponse) =>
                ReciterStudent.fromResponse(reciterStudentResponse))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  Future<ApiResult<String>> getSanadMinhajURL() async {
    var URL = await homeRemoteDataSource.getSanadMinhajURL();
    return URL;
  }

  @override
  Future<ApiResult<List<SanadMinhajCourse>>> getSanadMinhajProgress() async {
    final result = await homeRemoteDataSource.getSanadMinhajProgress();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((response) => SanadMinhajCourse.fromResponse(response))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }

  @override
  Future<ApiResult<List<HomeSection>>> getAllHomeSectionsForStudent() async {
    final result = await homeRemoteDataSource.getAllHomeSectionsForStudent();
    return result.when(
      success: (responseList) {
        final entityList = responseList
            .map((response) => HomeSection.fromResponse(response))
            .toList();
        return ApiResult.success(entityList);
      },
      failure: (error) => ApiResult.failure(error),
    );
  }
}
