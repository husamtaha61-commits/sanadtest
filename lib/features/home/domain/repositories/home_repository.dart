import '../../../../../../core/network/api_response.dart';
import '../../../student/rescheduling/domain/entites/session.dart';
import '../../data/models/requests/announcement_request.dart';
import '../../data/models/requests/my_sessions_request.dart';
import '../../data/models/requests/slider_request.dart';
import '../entites/announcement.dart';
import '../entites/currently_session.dart';
import '../entites/global_reciters_section.dart';
import '../entites/home_section.dart';
import '../entites/program.dart';
import '../entites/reciter_student.dart';
import '../entites/sanad_minhaj_progress.dart';
import '../entites/slider_content.dart';
import '../entites/student_progress.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Program>>> getAllPrograms();

  Future<ApiResult<List<Session>>> getMySessions(
      MySessionsRequest mySessionsRequest);

  Future<ApiResult<List<CurrentlySession>>> getMyCurrentlySessions();

  Future<ApiResult<List<SliderContent>>> getSlider(SliderRequest sliderRequest);

  Future<ApiResult<GlobalRecitersSection>> getGlobalRecitersSection();

  Future<ApiResult<List<Announcement>>> getAnnouncements(
      AnnouncementRequest announcementRequest);

  Future<ApiResult<StudentProgress>> getStudentProgress(int studentId);
  Future<ApiResult<List<ReciterStudent>>> getReciterStudents();
  Future<ApiResult<List<SanadMinhajCourse>>> getSanadMinhajProgress();
  Future<ApiResult<List<HomeSection>>> getAllHomeSectionsForStudent();
}
