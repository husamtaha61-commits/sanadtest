import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/account_settings/domain/model/requests/khitma_suspension_request.dart';
import '../../features/auth/data/models/requests/user_change_password_request.dart';
import '../../features/home/data/models/responses/announcement_response.dart';
import '../../features/home/data/models/responses/currently_session_response.dart';
import '../../features/home/data/models/responses/global_connection_reciter_response.dart';
import '../../features/home/data/models/responses/home_section_response.dart';
import '../../features/home/data/models/responses/program_response.dart';
import '../../features/home/data/models/responses/reciter_student_response.dart';
import '../../features/home/data/models/responses/slider_response.dart';
import '../../features/home/data/models/responses/student_progress_response.dart';
import '../../features/home/data/models/responses/wordpress_response.dart';
import '../../features/home/data/models/responses/sanad_course_response.dart';
import '../../features/messaging/data/models/responses/messaging_contact_response.dart';
import '../../features/my_requests/data/models/requests/approve_request_request.dart';
import '../../features/my_requests/data/models/responses/my_requests_response.dart';
import '../../features/notification/data/models/responses/action_center_response.dart';
import '../../features/notification/data/models/responses/notification_response.dart';
import '../../features/reciter/khitma_progress/data/models/responses/reciter_statistics_response.dart';
import '../../features/reciter/registration/data/models/requests/reciter_validation_submit_job_step_1_request.dart';
import '../../features/session_details/data/models/bookmark_response.dart';
import '../../features/session_details/data/models/last_page_response.dart';
import '../../features/session_details/data/models/note_response.dart';
import '../../features/session_details/data/models/requests/complete_session_request.dart';
import '../../features/session_details/data/models/session_details_response.dart';
import '../../features/shared/data/models/requests/user_device_token_request.dart';
import '../../features/shared/data/models/requests/user_settings_request.dart';
import '../../features/shared/data/models/responses/admin_config_response.dart';
import '../../features/shared/data/models/responses/generate_meeting_response.dart';
import '../../features/shared/data/models/responses/user_info_response.dart';
import '../../features/skills_notes/data/models/skill_response.dart';
import '../../features/skills_notes/data/models/user_subscription_ids_response.dart';
import '../../features/student/my_progress/data/models/responses/student_statistics_response.dart';
import '../../features/student/payment/data/models/responses/payment_status_model_response.dart';
import '../../features/student/rescheduling/data/models/requests/add_extra_session_request.dart';
import '../../features/student/rescheduling/data/models/requests/reschedule_recuuring_sessions_request.dart';
import '../../features/student/rescheduling/data/models/requests/reschedule_session_once_request.dart';
import '../../features/student/rescheduling/data/models/responses/my_schedule_response.dart';
import '../../features/student/scheduling/data/models/requests/schedule_session_request.dart';
import '../../features/auth/data/models/requests/user_complete_login_by_social_request.dart';
import '../../features/auth/data/models/requests/user_email_verify_request.dart';
import '../../features/auth/data/models/responses/user_email_verify_response.dart';
import '../../features/auth/data/models/requests/user_login_by_social_request.dart';
import '../../features/auth/data/models/requests/user_reset_password_request.dart';
import '../../features/auth/data/models/requests/user_send_otp_request.dart';
import '../../features/auth/data/models/requests/user_signin_request.dart';
import '../../features/auth/data/models/requests/user_signup_request.dart';
import '../../features/auth/data/models/responses/user_signup_response.dart';
import '../../features/auth/data/models/responses/user_validate_otp_response.dart';
import '../../features/reciter/registration/data/models/responses/available_times_options_response.dart';
import '../../features/shared/data/models/responses/lookups_data_response.dart';
import '../../features/student/scheduling/data/models/requests/add_reciter_to_favorite_request.dart';
import '../../features/student/scheduling/data/models/responses/reciter_response.dart';
import '../../features/student/scheduling/domain/entites/change_reciter_availability_request.dart';
import '../../features/student/subscription/data/models/responses/get_random_quran_response.dart';
import '../../features/student/subscription/data/models/responses/get_student_subscribition_response.dart';
import '../../features/student/payment/data/models/requests/payment_checkout_request.dart';
import '../../features/student/payment/data/models/responses/payment_checkout_response.dart';
import '../../features/student/subscription/data/models/responses/post_student_subscribition_model_response.dart';
import '../responses/base_pagination_response.dart';
import 'api_response.dart';

part 'retrofit_client.g.dart';

@RestApi()
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  //S--------------------Student--------------------S//

  @POST('/Student/Register')
  Future<ApiResponse<UserSignupResponse>> signup(
      @Body() UserSignupRequest userSignupRequest);

  @POST('/Student/CompleteLoginBy')
  Future<ApiResponse> completeLoginBySocial(
      @Body()
      UserCompleteLoginBySocialRequest userCompleteLoginBySocialRequest);

  @POST('/Student/Subscribe')
  @MultiPart()
  Future<ApiResponse<StudentSubscriptionDataModel>> studentSubscription(
    @Body() FormData formData,
    @SendProgress() ProgressCallback onProgress,
  );

  @GET('/UserSubscription/GetByStudentId/{studentId}')
  Future<ApiResponse<UserSubscriptionIdsResponse>> getSubscriptionByStudentId(
      @Path('studentId') int studentId);

  @GET('/UserSkill/GetBySubscriptionId/{subscriptionId}')
  Future<ApiResponse<List<SkillResponse>>> getUserSkillsBySubscriptionId(
      @Path('subscriptionId') int subscriptionId);

  @POST('/payments/checkout')
  Future<ApiResponse<PaymentCheckoutResponse>> checkout(
      @Body() PaymentCheckoutRequest request);

  @GET('/Student/GetMyStudents')
  Future<ApiResponse<List<ReciterStudentResponse>>> getReciterStudents();

  @POST('/Student/ValidatePhoneNumber')
  Future<ApiResponse<String>> verifyPhoneNumber(
      @Query('phoneNumber') String phoneNumber);

  @GET("/UserSubscription/GetMySubscription")
  Future<ApiResponse<List<SubscriptionModel>>> getMySubscriptions();

  @PUT('/UserSubscription/UpdateSubscription')
  Future<ApiResponse> resubmitSubscription(
    @Body() FormData request,
  );

  @GET('/payments/{id}')
  Future<ApiResponse<PaymentStatusModel>> getPaymentStatus(
    @Path('id') String subscriptionId,
  );

  //E--------------------Student--------------------E//

  //S--------------------Account--------------------S//

  @POST('/Account/Login/')
  Future<ApiResponse<UserSignupResponse>> signin(
      @Body() UserSignInRequest userSignInRequest);

  @POST('/Account/VerifyAccount')
  Future<ApiResponse<UserEmailVerifiyResponse>> verifyEmail(
      @Body() UserEmailVerifiyRequest userEmailVerifiyRequest);

  @POST('/Account/LoginBy')
  Future<ApiResponse<UserSignupResponse>> loginBySocial(
      @Body() UserLoginBySocialRequest userLoginBySocialRequest);

  @POST('/Account/SendOtp')
  Future<ApiResponse> sendOtp(@Body() UserSendOtpRequest userSendOtpRequest);

  @POST('/Account/ValidateOtp')
  Future<ApiResponse<UserValidateOtpResponse>> validateOtp(
      @Body() UserEmailVerifiyRequest userEmailVerifiyRequest);

  @POST('/Account/ResetPassword')
  Future<ApiResponse> resetPassword(
      @Body() UserResetPasswordRequest userResetPasswordRequest);

  @POST('/Account/CheckUserUniqueData')
  Future<ApiResponse> validateReciterSubmitJobStep1(
    @Body()
    ReciterValidationSubmitJobStep1Request
        reciterValidationSubmitJobStep1Request,
  );

  @DELETE('/Account/DeleteStudentAccount')
  Future<ApiResponse> deleteAccount();

  @POST('/Request/SubmitSuspendRequest')
  Future<ApiResponse> khitmaSuspension(
    @Body() KhitmaSuspensionRequest request,
  );

  @POST("/Account/ChangePassword")
  Future<ApiResponse> changePassword(
    @Body() ChangePasswordRequest request,
  );

  //E--------------------Account--------------------E//

  //S--------------------Lookup--------------------S//

  @GET('/Lookup/GetLookUpsData')
  Future<ApiResponse<LookUpsDataResponse>> getLookUpsData(
      @Query('LookupsIds') List<int> id);

  @GET('/Lookup/GetAvailableTimesOptions')
  Future<ApiResponse<List<TimeDataResponse>>> getAvailableTimesOptions();

  //E--------------------Lookup--------------------E//

  //S--------------------User--------------------S//

  @GET('/User/GetUserInfo')
  Future<ApiResponse<UserInfoResponse>> getUserInfo(
    @Query("userId") int? userId,
  );

  @POST('/User/AddDeviceToken')
  Future<ApiResponse> addDeviceToken(
      @Body() UserDeviceTokenRequest userDeviceTokenRequest);

  @PUT('/User/UpdateSettings')
  Future<ApiResponse> updateUserSettings(
      @Body() UserSettingsRequest userSettingsRequest);

  //E--------------------User--------------------E//

  //S--------------------Quran Template--------------------S//

  @GET('/QuranTemplate/GetRandom')
  Future<ApiResponse<GetRandomQuranResponse>> getRandomQuran();

  //E--------------------Quran Template--------------------E//

  //S-----------------------Reciter-----------------------S//

  @GET('/Reciter/GetReciters')
  Future<ApiResponse<BasePaginationResponse<ReciterResponse>>> getReciters(
    @Query('SearchTerm') String? searchTerm,
    @Query('RecitersAvailableTime.DayIds') List<int>? days,
    @Query('RecitersAvailableTime.Periods') List<int>? periods,
    @Query('AgeRanges') List<int>? ageRanges,
    @Query('TeachingLanguagesIds') List<int>? teachingLanguagesIds,
    @Query('MainLangaugeId') int? mainLangaugeId,
    @Query('NationalityId') int? nationalityId,
    @Query('GenderId') int? genderId,
    @Query('RecitationTypeId') int? recitationId,
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
    @Query('FavoritesOnly') bool? favoritesOnly,
    @Query('AvailableForLiveSession') bool? availableForLiveSession,
  );

  @GET('/ReciterTime/GetById/{reciterId}')
  Future<ApiResponse<List<TimeDataResponse>>> getReciterAvailableTimes(
    @Path('reciterId') int reciterId,
  );

  @GET('/ReciterTime/GetForLimit')
  Future<ApiResponse<List<TimeDataResponse>>> getReciterAbailableTimesForLimit(
    @Query('ReciterId') int reciterId,
    @Query('LimitByDays') int? limitByDays,
    @Query('IncludeQuarters') bool? includeQuarters,
    @Query('IncludesThirds') bool? includesThirds,
  );

  @GET('/Reciter/GetReciterById/{reciterId}')
  Future<ApiResponse<ReciterResponse>> getReciterById(
      @Path('reciterId') int reciterId);

  @GET('/Progress/GetReciterStatistics')
  Future<ApiResponse<ReciterStatisticsResponse>> getReciterStatistics();

  @POST('/Reciter/ToggleRecievingStudents')
  Future<ApiResponse<bool>> setIsReceivingNewStudents(
      @Query('IsRecievingNewStudents') bool isReceivingNewStudents);

  @PUT("/ReciterTime/Update")
  Future<ApiResponse<bool>> changeReciterAvailability(
      @Body() List<ChangeReciterAvailabilityRequest> request);

  //E-----------------------Reciter-----------------------E//

  //S-----------------------FavoriteReciters-----------------------S//

  @POST('/FavoriteReciters/Add')
  Future<ApiResponse> addReciterToFavorite(
    @Body() AddReciterToFavoriteRequest addReciterToFavoriteRequest,
  );

  @DELETE('/FavoriteReciters/Delete')
  Future<ApiResponse> deleteReciterFromFavorite(
    @Body() AddReciterToFavoriteRequest addReciterToFavoriteRequest,
  );

  //E-----------------------FavoriteReciters-----------------------E//

  //S---------------------------Session---------------------------S//

  // All sessions at the end of the program
  @GET('/Session/GetMySchedule')
  Future<ApiResponse<MyScheduleResponse>> getMySchedule();

  @GET('/Session/GetMySessions')
  Future<ApiResponse<List<SessionResponse>>> getMySessions(
    @Query('DateStart') String? dateStart,
    @Query('DateLimit') String? dateLimit,
  );

  @GET('/Session/GetMyCurrentlySessions')
  Future<ApiResponse<List<CurrentlySessionResponse>>> getMyCurrentlySessions();

  // Recuring sessions
  @GET('/Session/GetScheduleTimes')
  Future<ApiResponse<List<TimeDataResponse>>> getScheduleTimes(
      @Query("studentId") int? studentId);

  @GET("/Session/GetSessionDetails/{sessionId}")
  Future<ApiResponse<SessionDetailsResponse>> getSessionDetails(
    @Path('sessionId') String sessionId,
  );

  @PUT("/Session/CompleteSession")
  Future<ApiResponse> completeSession(
    @Body() CompleteSessionRequest completeSessionRequest,
  );

  @GET("/Progress/GetLastPageBySessionId/{sessionId}")
  Future<ApiResponse<LastPageResponse>> getLastPageBySessionId(
    @Path('sessionId') String sessionId,
  );

  @PUT("/Session/Cancel/{sessionId}")
  Future<ApiResponse> cancelSession(
    @Path('sessionId') String sessionId,
  );

  @POST("/Session/validateCancellation")
  Future<ApiResponse<bool>> validateSessionCancellation(
    @Query('sessionId') String sessionId,
  );

  //E---------------------------Session---------------------------E//

  //S---------------------------Session Note & Bookmark & Token---------------------------S//

  @GET('/SessionNote/Get')
  Future<ApiResponse<BasePaginationResponse<NoteResponse>>> getAllNotes(
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
    @Query('IsAuthoredByMe') bool? isAuthoredByMe,
    @Query("SessionId") String? sessionId,
    @Query("StudentId") int? studentId,
  );

  @GET('/Bookmark/Get')
  Future<ApiResponse<BasePaginationResponse<BookmarkGroupResponse>>>
      getAllBookmarks(
          @Query('PageNumber') int? pageNumber,
          @Query('PageSize') int? pageSize,
          @Query('GroupBySurahId') bool? groupBySurahId,
          @Query("SessionId") String? sessionId);

  @POST('/SessionToken/Add/{id}')
  Future<ApiResponse> addSessionToken(@Path('id') String id);

  //E---------------------------Session Note & Bookmark & Token---------------------------E//

  //S----------------------------Request-----------------------------S//

  @GET('/Request/GetMyRequests')
  Future<ApiResponse<BasePaginationResponse<MyRequestsResponse>>> getMyRequests(
    @Query('StatusId') int? statusId,
    @Query('TypeId') int? typeId,
    @Query('RequesterSideId') int? requesterSideId,
    @Query('PageNumber') int? pageNumber,
    @Query('PageSize') int? pageSize,
    @Query('SearchTerm') String? searchTerm,
  );

  @GET('/Request/GetRequest/{requestId}')
  Future<ApiResponse<MyRequestsResponse>> getRequestById(
    @Path('requestId') int id,
  );

  @POST('/Request/AddSchedule')
  Future<ApiResponse> scheduleSession(
    @Body() ScheduleSessionRequest scheduleSessionRequest,
  );

  @POST('/Request/Reschedule')
  Future<ApiResponse> rescheduleRecuuringSessions(
      @Body()
      RescheduleRecuuringSessionsRequest rescheduleRecuuringSessionsRequest);

  @POST('/Request/RescheduleOnce')
  Future<ApiResponse> rescheduleSessionOnce(
      @Body() RescheduleSessionOnceRequest rescheduleSessionOnceRequest);

  @POST('/Request/Approve')
  Future<ApiResponse> approveRequest(
      @Body() ApproveRequestRequest approveRequestRequest);

  @PATCH('/Request/Cancel/{requestId}')
  Future<ApiResponse> cancelRequest(@Path('requestId') requestId);

  @PATCH('/Request/Reject/{requestId}')
  Future<ApiResponse> rejectRequest(@Path('requestId') requestId);

  @POST('/Request/Makeup')
  Future<ApiResponse> makeupSessionRequest(
    @Body() RescheduleSessionOnceRequest makeupSessionRequest,
  );

  @POST('/Request/AddExtraSession')
  Future<ApiResponse> addExtraSessionRequest(
    @Body() AddExtraSessionRequest addExtraSessionRequest,
  );

  @POST('/Request/ReciterAccountDeleteRequest')
  Future<ApiResponse> submitReciterAccountSettingsRequest();

  @POST('/Request/SubmitStudentAccountSettingsRequest')
  @MultiPart()
  Future<ApiResponse> submitStudentAccountSettings(
    @Part() Map<String, dynamic> parts,
  );

  @POST('/Request/SubmitReciterAccountSettingsRequest')
  @MultiPart()
  Future<ApiResponse> submitReciterAccountSettings(
    @Body() FormData formData,
  );
  //E----------------------------Request-----------------------------E//

  //S----------------------------Configuration-----------------------------S//

  @GET('/Configuration/GetConfig')
  Future<ApiResponse<AdminConfigResponse>> getAdminConfig();

  //E----------------------------Configuration-----------------------------E//

  //S----------------------------Meeting-----------------------------S//

  @GET('/Meeting/Generate')
  Future<ApiResponse<GenerateMeetingResponse>> generateMeetingLink(
      @Query('sessionId') String id);

  @GET('/Meeting/IsMeetingRunning')
  Future<ApiResponse<bool>> isMeetingRunning(@Query('meetingId') String id);

  //E----------------------------Meeting-----------------------------E//

  //S----------------------------Program-----------------------------S//

  @GET('/Program/GetAll')
  Future<ApiResponse<List<ProgramResponse>>> getAllPrograms();

  //E----------------------------Program-----------------------------E//

  //S----------------------------Home-----------------------------S//

  @GET('/Slider/GetAllNodes')
  Future<ApiResponse<BasePaginationResponse<SliderResponse>>> getSlider(
    @Query("IsDisabled") bool? isDisabled,
  );

  @GET('/GlobalRecitersSection/Get')
  Future<ApiResponse<GlobalRecitersSectionResponse>> getGlobalRecitersSection();

  @GET('/Announcement/GetAll')
  Future<ApiResponse<BasePaginationResponse<AnnouncementResponse>>>
      getAnnouncements(
    @Query("IsActive") bool? isActive,
  );

  @GET('/HomeSection/GetAllForStudent')
  Future<ApiResponse<List<HomeSectionResponse>>> getAllHomeSectionsForStudent();

  //S----------------------------Sanad-----------------------------S//
  @GET('/Student/GetWordPressSsoUrl')
  Future<WordPressResponse> getSanadMinhajURL();

  @GET('/Progress/GetSanadMinhajProgress')
  Future<ApiResponse<List<SanadCourseResponse>>> getSanadMinhajProgress();
  //E----------------------------Sanad-----------------------------E//

  //E----------------------------Home-----------------------------E//

  //S----------------------------Progress-----------------------------S//

  @GET('/Progress/GetReadingProgressByStudentId/{studentId}')
  Future<ApiResponse<StudentProgressResponse>> getStudentProgress(
    @Path("studentId") int studentId,
  );

  @GET('/Progress/GetStudentStatistics')
  Future<ApiResponse<StudentStatisticsResponse>> getStudentStatistics(
    @Query("ReadingMinutesAverageInterval") int? readingMinutesAverageInterval,
    @Query("CompletedPagesAverageInterval") int? completedPagesAverageInterval,
  );

  //E----------------------------Progress-----------------------------E//

  //S----------------------------Notification-----------------------------S//

  @GET('/Notification/GetNotifications')
  Future<ApiResponse<BasePaginationResponse<NotificationResponse>>>
      getNotifications(
    @Query("PageNumber") int? pageNumber,
    @Query("PageSize") int? pageSize,
    @Query("SearchTerm") String? searchTerm,
    @Query("IsRead") bool? isRead,
  );

  @PATCH('/Notification/MarkAsRead/{notificationId}')
  Future<ApiResponse> markNotificationAsRead(
    @Path("notificationId") int notificationId,
  );

  @PATCH('/Notification/MarkAllAsRead/')
  Future<ApiResponse> markAllNotificationsAsRead();

  //E----------------------------Notification-----------------------------E//

  //S----------------------------ActionCenter/GetActions-----------------------------S//

  @GET('/ActionCenter/GetActions')
  Future<ApiResponse<BasePaginationResponse<ActionCenterResponse>>> getActions(
    @Query("PageNumber") int? pageNumber,
    @Query("PageSize") int? pageSize,
    @Query("SearchTerm") String? searchTerm,
  );

  //E----------------------------ActionCenter/GetActions-----------------------------E//

  //S----------------------------Messaging/Conversation------------------------------S//

  @GET('/Conversation/GetContacts')
  Future<ApiResponse<List<MessagingContactResponse>>> getMessagingContacts();

  @GET('/Conversation/GetToken')
  Future<String> getMessagingToken(
    @Query("isIos") bool isIos,
  );

  //E----------------------------Messaging/Conversation------------------------------E//
}
