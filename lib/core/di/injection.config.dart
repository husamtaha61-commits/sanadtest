// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i806;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sanad/core/bloc/app/app_cubit.dart' as _i267;
import 'package:sanad/core/bloc/data/data_cubit.dart' as _i781;
import 'package:sanad/core/config/time_ago_config.dart' as _i554;
import 'package:sanad/core/di/app_service_model.dart' as _i176;
import 'package:sanad/core/network/retrofit_client.dart' as _i503;
import 'package:sanad/core/routes/app_router.dart' as _i125;
import 'package:sanad/core/services/app_preferences.dart' as _i266;
import 'package:sanad/core/services/auth_service.dart' as _i102;
import 'package:sanad/core/services/firebase_messaging_listener.dart' as _i859;
import 'package:sanad/core/services/image_picker_service.dart' as _i252;
import 'package:sanad/core/services/localization_service.dart' as _i127;
import 'package:sanad/core/services/notification_service.dart' as _i705;
import 'package:sanad/features/account_settings/data/datasources/account_settings_data_source.dart'
    as _i390;
import 'package:sanad/features/account_settings/data/repositories/account_settings_repository_impl.dart'
    as _i1064;
import 'package:sanad/features/account_settings/domain/repositories/account_settings_repository.dart'
    as _i625;
import 'package:sanad/features/account_settings/domain/usecases/change_password_use_case.dart'
    as _i836;
import 'package:sanad/features/account_settings/domain/usecases/delete_account_use_case.dart'
    as _i495;
import 'package:sanad/features/account_settings/domain/usecases/delete_reciter_request_use_case.dart'
    as _i875;
import 'package:sanad/features/account_settings/domain/usecases/khitma_suspension_use_case.dart'
    as _i928;
import 'package:sanad/features/account_settings/domain/usecases/update_reciter_settings_use_casae.dart'
    as _i31;
import 'package:sanad/features/account_settings/domain/usecases/update_student_settings_use_case.dart'
    as _i612;
import 'package:sanad/features/account_settings/presentation/bloc/account_settings/account_settings_cubit.dart'
    as _i864;
import 'package:sanad/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i30;
import 'package:sanad/features/auth/data/repositories/auth_repository_impl.dart'
    as _i848;
import 'package:sanad/features/auth/domain/repositories/auth_repository.dart'
    as _i970;
import 'package:sanad/features/auth/domain/usecases/complete_login_by_social_usecase.dart'
    as _i137;
import 'package:sanad/features/auth/domain/usecases/login_by_social_usecase.dart'
    as _i697;
import 'package:sanad/features/auth/domain/usecases/reset_password_usecase.dart'
    as _i840;
import 'package:sanad/features/auth/domain/usecases/send_otp_usecase.dart'
    as _i1042;
import 'package:sanad/features/auth/domain/usecases/signin_usecase.dart'
    as _i37;
import 'package:sanad/features/auth/domain/usecases/signup_usecase.dart'
    as _i596;
import 'package:sanad/features/auth/domain/usecases/validate_otp_usecase.dart'
    as _i618;
import 'package:sanad/features/auth/domain/usecases/verifiy_email_usecase.dart'
    as _i637;
import 'package:sanad/features/auth/presentation/bloc/auth/auth_cubit.dart'
    as _i1053;
import 'package:sanad/features/home/data/datasources/home_remote_data_source.dart'
    as _i1006;
import 'package:sanad/features/home/data/repositories/home_repository_impl.dart'
    as _i987;
import 'package:sanad/features/home/domain/repositories/home_repository.dart'
    as _i954;
import 'package:sanad/features/home/domain/usecases/get_all_programs_use_case.dart'
    as _i603;
import 'package:sanad/features/home/domain/usecases/get_all_reciter_students_use_case.dart'
    as _i195;
import 'package:sanad/features/home/domain/usecases/get_announcements_use_case.dart'
    as _i29;
import 'package:sanad/features/home/domain/usecases/get_global_reciters_section_use_case.dart'
    as _i289;
import 'package:sanad/features/home/domain/usecases/get_home_sections_use_case.dart'
    as _i519;
import 'package:sanad/features/home/domain/usecases/get_my_currently_session_use_case.dart'
    as _i786;
import 'package:sanad/features/home/domain/usecases/get_my_sessions_use_case.dart'
    as _i877;
import 'package:sanad/features/home/domain/usecases/get_sanad_minhaj_progress_use_case.dart'
    as _i1004;
import 'package:sanad/features/home/domain/usecases/get_slider_content_use_case.dart'
    as _i213;
import 'package:sanad/features/home/domain/usecases/get_student_progress_use_case.dart'
    as _i725;
import 'package:sanad/features/home/presentation/bloc/Announcements/announcements_cubit.dart'
    as _i845;
import 'package:sanad/features/home/presentation/bloc/global_reciters_section/global_reciters_section_cubit.dart'
    as _i405;
import 'package:sanad/features/home/presentation/bloc/home_sections/home_sections_cubit.dart'
    as _i779;
import 'package:sanad/features/home/presentation/bloc/my_sessions/my_sessions_cubit.dart'
    as _i337;
import 'package:sanad/features/home/presentation/bloc/programs/program_cubit.dart'
    as _i120;
import 'package:sanad/features/home/presentation/bloc/reciter_student/reciter_student_cubit.dart'
    as _i692;
import 'package:sanad/features/home/presentation/bloc/SanadMinhaj/sanad_minhaj_progress_cubit.dart'
    as _i157;
import 'package:sanad/features/home/presentation/bloc/slider_content/slider_content_cubit.dart'
    as _i1022;
import 'package:sanad/features/home/presentation/bloc/student_progress/student_progress_cubit.dart'
    as _i414;
import 'package:sanad/features/main/presentation/bloc/navbar/navbar_cubit.dart'
    as _i925;
import 'package:sanad/features/messaging/data/datasources/messaging_remote_data_source.dart'
    as _i478;
import 'package:sanad/features/messaging/data/repositories/messaging_repository_impl.dart'
    as _i862;
import 'package:sanad/features/messaging/domain/repositories/messaging_repository.dart'
    as _i937;
import 'package:sanad/features/messaging/domain/usecases/get_messaging_contacts_use_case.dart'
    as _i872;
import 'package:sanad/features/messaging/domain/usecases/get_messaging_token_use_case.dart'
    as _i436;
import 'package:sanad/features/messaging/presentation/bloc/messaging/messaging_cubit.dart'
    as _i320;
import 'package:sanad/features/messaging/presentation/bloc/messaging_contact/messaging_contact_cubit.dart'
    as _i198;
import 'package:sanad/features/my_requests/data/datasources/my_requests_remote_data_source.dart'
    as _i85;
import 'package:sanad/features/my_requests/data/repositories/my_requests_repository_imp.dart'
    as _i3;
import 'package:sanad/features/my_requests/domain/repositories/my_requests_repository.dart'
    as _i784;
import 'package:sanad/features/my_requests/domain/usecases/approve_request_use_case.dart'
    as _i602;
import 'package:sanad/features/my_requests/domain/usecases/cancel_request_use_case.dart'
    as _i218;
import 'package:sanad/features/my_requests/domain/usecases/get_my_requests_use_case.dart'
    as _i751;
import 'package:sanad/features/my_requests/domain/usecases/get_request_by_id_use_case.dart'
    as _i138;
import 'package:sanad/features/my_requests/domain/usecases/reject_request_use_case.dart'
    as _i723;
import 'package:sanad/features/my_requests/presentation/bloc/my_requests/my_requests_cubit.dart'
    as _i895;
import 'package:sanad/features/my_requests/presentation/bloc/my_requests_actions/my_requests_actions_cubit.dart'
    as _i103;
import 'package:sanad/features/notification/data/datasources/notification_action_remote_data_source.dart'
    as _i593;
import 'package:sanad/features/notification/data/repositories/notification_action_repository_impl.dart'
    as _i804;
import 'package:sanad/features/notification/domain/repositories/notification_action_repository.dart'
    as _i116;
import 'package:sanad/features/notification/domain/usecases/get_actions_center_use_case.dart'
    as _i1021;
import 'package:sanad/features/notification/domain/usecases/get_notifications_use_case.dart'
    as _i484;
import 'package:sanad/features/notification/domain/usecases/mark_all_notifications_as_read.dart'
    as _i118;
import 'package:sanad/features/notification/domain/usecases/mark_notification_as_read_use_case.dart'
    as _i727;
import 'package:sanad/features/notification/presentation/bloc/action_center/action_center_cubit.dart'
    as _i498;
import 'package:sanad/features/notification/presentation/bloc/notification/notification_cubit.dart'
    as _i839;
import 'package:sanad/features/reciter/khitma_progress/data/datasources/reciter_khitma_progress_remote_data_source.dart'
    as _i338;
import 'package:sanad/features/reciter/khitma_progress/data/repositories/reciter_khitma_progress_repository_impl.dart'
    as _i456;
import 'package:sanad/features/reciter/khitma_progress/domain/repositories/reciter_khitma_progress_repository.dart'
    as _i199;
import 'package:sanad/features/reciter/khitma_progress/domain/usecases/get_reciter_statistics_use_case.dart'
    as _i939;
import 'package:sanad/features/reciter/khitma_progress/presentation/bloc/reciter_statistics/reciter_statistics_cubit.dart'
    as _i678;
import 'package:sanad/features/reciter/registration/data/datasources/reciter_registration_remote_data_source.dart'
    as _i1039;
import 'package:sanad/features/reciter/registration/data/repositories/reciter_registration_repository_impl.dart'
    as _i843;
import 'package:sanad/features/reciter/registration/domain/repositories/reciter_registration_repository.dart'
    as _i522;
import 'package:sanad/features/reciter/registration/domain/usecases/reciter_complete_registration_use_case.dart'
    as _i618;
import 'package:sanad/features/reciter/registration/domain/usecases/reciter_registration_use_case.dart'
    as _i557;
import 'package:sanad/features/reciter/registration/domain/usecases/validate_reciter_submit_job_step_1_use_case.dart'
    as _i175;
import 'package:sanad/features/reciter/registration/presentation/bloc/reciter_complete_profile/reciter_complete_profile_cubit.dart'
    as _i997;
import 'package:sanad/features/reciter/registration/presentation/bloc/reciter_submit_job/reciter_submit_job_cubit.dart'
    as _i168;
import 'package:sanad/features/session_details/data/datasources/session_details_remote_data_source.dart'
    as _i889;
import 'package:sanad/features/session_details/data/repositories/session_details_repository_impl.dart'
    as _i410;
import 'package:sanad/features/session_details/domain/repositories/session_details_repository.dart'
    as _i337;
import 'package:sanad/features/session_details/domain/usecases/complete_session_use_case.dart'
    as _i506;
import 'package:sanad/features/session_details/domain/usecases/get_last_page_by_session_id_use_case.dart'
    as _i275;
import 'package:sanad/features/session_details/domain/usecases/get_session_details_by_session_id_use_case.dart'
    as _i439;
import 'package:sanad/features/session_details/presentation/bloc/session_confirmation/session_confirmation_cubit.dart'
    as _i725;
import 'package:sanad/features/session_details/presentation/bloc/session_details/session_details_cubit.dart'
    as _i496;
import 'package:sanad/features/shared/data/datasource/admin_remote_datasource.dart'
    as _i212;
import 'package:sanad/features/shared/data/datasource/lookup_remote_datasource.dart'
    as _i320;
import 'package:sanad/features/shared/data/datasource/meeting_remore_datasource.dart'
    as _i78;
import 'package:sanad/features/shared/data/datasource/program_available_times_remote_datasource.dart'
    as _i64;
import 'package:sanad/features/shared/data/datasource/session_token_remote_datasource.dart'
    as _i711;
import 'package:sanad/features/shared/data/datasource/user_remote_data_source.dart'
    as _i295;
import 'package:sanad/features/shared/data/repositories/admin_repository_impl.dart'
    as _i264;
import 'package:sanad/features/shared/data/repositories/lookup_repository_impl.dart'
    as _i109;
import 'package:sanad/features/shared/data/repositories/meeting_repository_impl.dart'
    as _i836;
import 'package:sanad/features/shared/data/repositories/program_available_times_repository_impl.dart'
    as _i540;
import 'package:sanad/features/shared/data/repositories/session_token_repository_impl.dart'
    as _i248;
import 'package:sanad/features/shared/data/repositories/user_repository_impl.dart'
    as _i168;
import 'package:sanad/features/shared/domain/repositories/admin_repository.dart'
    as _i239;
import 'package:sanad/features/shared/domain/repositories/lookup_repository.dart'
    as _i972;
import 'package:sanad/features/shared/domain/repositories/meeting_repository.dart'
    as _i146;
import 'package:sanad/features/shared/domain/repositories/program_available_times_repository.dart'
    as _i649;
import 'package:sanad/features/shared/domain/repositories/session_token_repository.dart'
    as _i41;
import 'package:sanad/features/shared/domain/repositories/user_repository.dart'
    as _i666;
import 'package:sanad/features/shared/domain/usecases/add_device_token_use_case.dart'
    as _i1011;
import 'package:sanad/features/shared/domain/usecases/add_session_token_use_case.dart'
    as _i518;
import 'package:sanad/features/shared/domain/usecases/generate_meeting_link_use_case.dart'
    as _i1070;
import 'package:sanad/features/shared/domain/usecases/get_admin_config_use_case.dart'
    as _i342;
import 'package:sanad/features/shared/domain/usecases/get_lookups_data_usecase.dart'
    as _i601;
import 'package:sanad/features/shared/domain/usecases/get_program_available_times_usecase.dart'
    as _i85;
import 'package:sanad/features/shared/domain/usecases/get_user_info_usecase.dart'
    as _i166;
import 'package:sanad/features/shared/domain/usecases/is_meeting_running_use_case.dart'
    as _i725;
import 'package:sanad/features/shared/domain/usecases/update_user_settings_use_case.dart'
    as _i641;
import 'package:sanad/features/shared/presentation/bloc/admin/admin_cubit.dart'
    as _i384;
import 'package:sanad/features/shared/presentation/bloc/lookup/lookup_cubit.dart'
    as _i704;
import 'package:sanad/features/shared/presentation/bloc/meeting/meeting_cubit.dart'
    as _i921;
import 'package:sanad/features/shared/presentation/bloc/program_available_times/program_available_times_cubit.dart'
    as _i1023;
import 'package:sanad/features/shared/presentation/bloc/session_token/session_token_cubit.dart'
    as _i32;
import 'package:sanad/features/shared/presentation/bloc/user/user_cubit.dart'
    as _i500;
import 'package:sanad/features/skills_notes/data/datasources/skills_notes_remote_data_source.dart'
    as _i1073;
import 'package:sanad/features/skills_notes/data/repositories/skills_notes_repository_impl.dart'
    as _i139;
import 'package:sanad/features/skills_notes/domain/repositories/skills_notes_repository.dart'
    as _i696;
import 'package:sanad/features/skills_notes/domain/usecases/get_all_bookmarks_use_case.dart'
    as _i1067;
import 'package:sanad/features/skills_notes/domain/usecases/get_all_notes_use_case.dart'
    as _i258;
import 'package:sanad/features/skills_notes/domain/usecases/get_subscription_id_use_case.dart'
    as _i46;
import 'package:sanad/features/skills_notes/domain/usecases/get_user_skills_by_subscription_id_use_case.dart'
    as _i731;
import 'package:sanad/features/skills_notes/presentation/bloc/bookmark/bookmark_cubit.dart'
    as _i40;
import 'package:sanad/features/skills_notes/presentation/bloc/note/note_cubit.dart'
    as _i118;
import 'package:sanad/features/skills_notes/presentation/bloc/skill/skill_cubit.dart'
    as _i703;
import 'package:sanad/features/student/my_progress/data/datasources/student_progress_remote_data_source.dart'
    as _i53;
import 'package:sanad/features/student/my_progress/data/repositories/student_progress_repository_impl.dart'
    as _i1056;
import 'package:sanad/features/student/my_progress/domain/repositories/student_progress_repository.dart'
    as _i507;
import 'package:sanad/features/student/my_progress/domain/usecases/get_student_statistics_use_case.dart'
    as _i932;
import 'package:sanad/features/student/my_progress/presentation/bloc/student_statistics/student_statistics_cubit.dart'
    as _i782;
import 'package:sanad/features/student/payment/data/datasource/remote_data_source.dart'
    as _i739;
import 'package:sanad/features/student/payment/data/repositries/payment_repositry_impl.dart'
    as _i704;
import 'package:sanad/features/student/payment/domain/repositries/payment_repositry.dart'
    as _i882;
import 'package:sanad/features/student/profile/presentation/bloc/student_profile/student_profile_cubit.dart'
    as _i411;
import 'package:sanad/features/student/rescheduling/data/datasources/student_my_schedule_data_source.dart'
    as _i552;
import 'package:sanad/features/student/rescheduling/data/repositories/student_my_schedule_repository_impl.dart'
    as _i427;
import 'package:sanad/features/student/rescheduling/domain/repositories/student_my_schedule_repository.dart'
    as _i815;
import 'package:sanad/features/student/rescheduling/domain/usecases/add_extra_session_use_case.dart'
    as _i81;
import 'package:sanad/features/student/rescheduling/domain/usecases/cancel_session_use_case.dart'
    as _i53;
import 'package:sanad/features/student/rescheduling/domain/usecases/get_student_my_schedule.dart'
    as _i204;
import 'package:sanad/features/student/rescheduling/domain/usecases/get_student_schedule_times.dart'
    as _i362;
import 'package:sanad/features/student/rescheduling/domain/usecases/makeup_session_use_case.dart'
    as _i801;
import 'package:sanad/features/student/rescheduling/domain/usecases/reschedule_recuuring_sessions_use_case.dart'
    as _i735;
import 'package:sanad/features/student/rescheduling/domain/usecases/reschedule_session_once_use_case.dart'
    as _i930;
import 'package:sanad/features/student/rescheduling/domain/usecases/validate_session_cancellation_use_case.dart'
    as _i601;
import 'package:sanad/features/student/rescheduling/presentation/bloc/student_my_recurring_sessions_cubit/student_my_recurring_sessions_cubit.dart'
    as _i124;
import 'package:sanad/features/student/rescheduling/presentation/bloc/student_my_schedule_cubit/student_my_schedule_cubit.dart'
    as _i457;
import 'package:sanad/features/student/rescheduling/presentation/bloc/student_reschedule_recuuring_sessions/student_reschedule_sessions_cubit.dart'
    as _i1027;
import 'package:sanad/features/student/scheduling/data/datasources/reciter_details_data_source.dart'
    as _i36;
import 'package:sanad/features/student/scheduling/data/datasources/reciter_listing_data_source.dart'
    as _i965;
import 'package:sanad/features/student/scheduling/data/repositories/reciter_details_repository_impl.dart'
    as _i263;
import 'package:sanad/features/student/scheduling/data/repositories/reciter_listing_repository_impl.dart'
    as _i860;
import 'package:sanad/features/student/scheduling/domain/repositories/reciter_details_repository.dart'
    as _i332;
import 'package:sanad/features/student/scheduling/domain/repositories/reciter_listing_repository.dart'
    as _i127;
import 'package:sanad/features/student/scheduling/domain/usecases/add_reciter_to_favorite_use_case.dart'
    as _i123;
import 'package:sanad/features/student/scheduling/domain/usecases/change_reciter_availability_use_case.dart'
    as _i88;
import 'package:sanad/features/student/scheduling/domain/usecases/delete_reciter_from_favorite_use_case.dart'
    as _i1041;
import 'package:sanad/features/student/scheduling/domain/usecases/get_reciter_available_times_for_limit_use_case.dart'
    as _i149;
import 'package:sanad/features/student/scheduling/domain/usecases/get_reciter_available_times_use_case.dart'
    as _i859;
import 'package:sanad/features/student/scheduling/domain/usecases/get_reciter_by_id_use_case.dart'
    as _i64;
import 'package:sanad/features/student/scheduling/domain/usecases/get_reciters_use_case.dart'
    as _i17;
import 'package:sanad/features/student/scheduling/domain/usecases/student_schedule_session_use_case.dart'
    as _i571;
import 'package:sanad/features/student/scheduling/domain/usecases/toggle_is_receiving_students_use_case.dart'
    as _i702;
import 'package:sanad/features/student/scheduling/presentation/bloc/reciter_available_times/reciter_available_times_cubit.dart'
    as _i939;
import 'package:sanad/features/student/scheduling/presentation/bloc/reciter_details/reciter_details_cubit.dart'
    as _i774;
import 'package:sanad/features/student/scheduling/presentation/bloc/reciter_favorite/reciter_favorite_cubit.dart'
    as _i137;
import 'package:sanad/features/student/scheduling/presentation/bloc/reciter_listing/reciter_listing_cubit.dart'
    as _i886;
import 'package:sanad/features/student/scheduling/presentation/bloc/student_schedule_session/student_schedule_session_cubit.dart'
    as _i487;
import 'package:sanad/features/student/subscription/data/datasources/subscription_remote_data_source.dart'
    as _i888;
import 'package:sanad/features/student/subscription/data/repositories/subscription_repository_impl.dart'
    as _i487;
import 'package:sanad/features/student/subscription/domain/repositories/subscription_repository.dart'
    as _i408;
import 'package:sanad/features/student/subscription/domain/usecases/get_random_quran_usecase.dart'
    as _i420;
import 'package:sanad/features/student/subscription/domain/usecases/student_subscription_usecase.dart'
    as _i803;
import 'package:sanad/features/student/subscription/domain/usecases/student_update_subsription_usecase.dart'
    as _i610;
import 'package:sanad/features/student/subscription/domain/usecases/verify_phone_number_use_case.dart'
    as _i711;
import 'package:sanad/features/student/subscription/presentation/bloc/get_random_quran/get_random_quran_cubit.dart'
    as _i256;
import 'package:sanad/features/student/subscription/presentation/bloc/subscription/subscription_cubit.dart'
    as _i231;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart'
    as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appServiceModel = _$AppServiceModel();
    await gh.factoryAsync<_i913.StreamingSharedPreferences>(
      () => appServiceModel.preferences(),
      preResolve: true,
    );
    gh.factory<_i925.NavbarCubit>(() => _i925.NavbarCubit());
    gh.lazySingleton<_i125.AppRouter>(() => appServiceModel.appRouter);
    gh.lazySingleton<_i361.Dio>(() => appServiceModel.dio);
    gh.lazySingleton<_i503.RetrofitClient>(
        () => appServiceModel.retrofitClient);
    gh.lazySingleton<_i59.FirebaseAuth>(() => appServiceModel.firebaseAuth);
    gh.lazySingleton<_i806.FacebookAuth>(() => appServiceModel.facebookAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => appServiceModel.googleSignIn);
    gh.lazySingleton<_i183.ImagePicker>(() => appServiceModel.imagePicker);
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => appServiceModel.firebaseMessaging);
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
        () => appServiceModel.flutterLocalNotificationsPlugin);
    gh.lazySingleton<_i141.FirebaseCrashlytics>(
        () => appServiceModel.firebaseCrashlytics);
    gh.lazySingleton<_i127.LocalizationService>(
        () => _i127.LocalizationService());
    gh.lazySingleton<_i781.DataCubit>(() => _i781.DataCubit());
    gh.lazySingleton<_i965.ReciterListingDataSource>(() =>
        _i965.ReciterListingDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i78.MeetingRemoreDatasource>(() =>
        _i78.MeetingRemoreDatasourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i30.AuthRemoteDataSource>(() =>
        _i30.AuthRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i320.LookupRemoteDataSource>(() =>
        _i320.LookupRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i552.StudentMyScheduleDataSource>(() =>
        _i552.StudentMyScheduleDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i889.SessionDetailsRemoteDataSource>(() =>
        _i889.SessionDetailsRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i1006.HomeRemoteDataSource>(() =>
        _i1006.HomeRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i337.SessionDetailsRepository>(() =>
        _i410.SessionDetailsRepositoryImpl(
            sessionDetailsRemoteDataSource:
                gh<_i889.SessionDetailsRemoteDataSource>()));
    gh.lazySingleton<_i593.NotificationActionRemoteDataSource>(() =>
        _i593.NotificationActionRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i116.NotificationActionRepository>(() =>
        _i804.NotificationActionRepositoryImpl(
            notificationActionRemoteDataSource:
                gh<_i593.NotificationActionRemoteDataSource>()));
    gh.lazySingleton<_i390.AccountSettingsDataSource>(() =>
        _i390.AccountSettingsDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i739.PaymentRemoteDataSource>(() =>
        _i739.PaymentRemoteDataSourceImpl(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i212.AdminRemoteDatasource>(() =>
        _i212.AdminRemoteDatasourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i64.ProgramAvailableTimesRemoteDatasource>(() =>
        _i64.ProgramAvailableTimesRemoteDatasourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i252.ImagePickerService>(
        () => _i252.ImagePickerService(gh<_i183.ImagePicker>()));
    gh.lazySingleton<_i85.MyRequestsRemoteDataSource>(() =>
        _i85.MyRequestsRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i1073.SkillsNotesRemoteDataSource>(() =>
        _i1073.SkillsNotesRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i478.MessagingRemoteDataSource>(() =>
        _i478.MessagingRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i36.ReciterDetailsDataSource>(() =>
        _i36.ReciterDetailsDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i888.SubscriptionRemoteDataSource>(() =>
        _i888.SubscriptionRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i295.UserRemoteDataSource>(() =>
        _i295.UserRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i53.StudentProgressRemoteDataSource>(() =>
        _i53.StudentProgressRemoteDataSourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i711.SessionTokenRemoteDatasource>(() =>
        _i711.SessionTokenDatasourceImp(
            retrofitClient: gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i1039.ReciterRegistrationRemoteDataSource>(
        () => _i1039.ReciterRegistrationRemoteDataSourceImp(
              gh<_i361.Dio>(),
              gh<_i503.RetrofitClient>(),
            ));
    gh.lazySingleton<_i972.LookupRepository>(() => _i109.LookupRepositoryImpl(
        lookupRemoteDataSource: gh<_i320.LookupRemoteDataSource>()));
    gh.lazySingleton<_i649.ProgramAvailableTimesRepository>(() =>
        _i540.ProgramAvailableTimesRepositoryImpl(
            programAvailableTimesRemoteDatasource:
                gh<_i64.ProgramAvailableTimesRemoteDatasource>()));
    gh.lazySingleton<_i266.AppPreferences>(() => _i266.AppPreferences(
          gh<_i913.StreamingSharedPreferences>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i937.MessagingRepository>(() =>
        _i862.MessagingRepositoryImpl(
            messagingRemoteDataSource: gh<_i478.MessagingRemoteDataSource>()));
    gh.lazySingleton<_i815.StudentMyScheduleRepository>(() =>
        _i427.StudentMyScheduleRepositoryImpl(
            studentMyScheduleDataSource:
                gh<_i552.StudentMyScheduleDataSource>()));
    gh.lazySingleton<_i696.SkillsNotesRepository>(() =>
        _i139.SkillsNotesRepositoryImpl(
            skillsNotesRemoteDataSource:
                gh<_i1073.SkillsNotesRemoteDataSource>()));
    gh.lazySingleton<_i239.AdminRepository>(() => _i264.AdminRepositoryImpl(
        adminRemoteDatasource: gh<_i212.AdminRemoteDatasource>()));
    gh.lazySingleton<_i41.SessionTokenRepository>(() =>
        _i248.SessionTokenRepositoryImpl(
            sessionTokenRemoteDatasource:
                gh<_i711.SessionTokenRemoteDatasource>()));
    gh.lazySingleton<_i859.FirebaseMessagingListener>(
        () => _i859.FirebaseMessagingListener(gh<_i125.AppRouter>()));
    gh.lazySingleton<_i625.AccountSettingsRepository>(() =>
        _i1064.AccountSettingsRepositoryImpl(
            accountSettingsDataSource: gh<_i390.AccountSettingsDataSource>()));
    gh.lazySingleton<_i127.ReciterListingRepository>(() =>
        _i860.ReciterListingRepositoryImpl(
            reciterListingDataSource: gh<_i965.ReciterListingDataSource>()));
    gh.lazySingleton<_i928.KhitmaSuspensionUseCase>(() =>
        _i928.KhitmaSuspensionUseCase(
            accountSettingsRepository: gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i836.ChangePasswordUseCase>(() =>
        _i836.ChangePasswordUseCase(
            accountSettingsRepository: gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i495.DeleteAccountUseCase>(() =>
        _i495.DeleteAccountUseCase(
            accountSettingsRepository: gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i705.NotificationService>(() => _i705.NotificationService(
          gh<_i892.FirebaseMessaging>(),
          gh<_i163.FlutterLocalNotificationsPlugin>(),
        ));
    gh.lazySingleton<_i954.HomeRepository>(() => _i987.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i1006.HomeRemoteDataSource>()));
    gh.lazySingleton<_i85.GetProgramAvailableTimesUseCase>(() =>
        _i85.GetProgramAvailableTimesUseCase(
            programAvailableTimesRepository:
                gh<_i649.ProgramAvailableTimesRepository>()));
    gh.lazySingleton<_i439.GetSessionDetailsBySessionIdUseCase>(() =>
        _i439.GetSessionDetailsBySessionIdUseCase(
            sessionDetailsRepository: gh<_i337.SessionDetailsRepository>()));
    gh.lazySingleton<_i275.GetLastPageBySessionIdUseCase>(() =>
        _i275.GetLastPageBySessionIdUseCase(
            sessionDetailsRepository: gh<_i337.SessionDetailsRepository>()));
    gh.lazySingleton<_i506.CompleteSessionUseCase>(() =>
        _i506.CompleteSessionUseCase(
            sessionDetailsRepository: gh<_i337.SessionDetailsRepository>()));
    gh.lazySingleton<_i342.GetAdminConfigUseCase>(() =>
        _i342.GetAdminConfigUseCase(
            adminRepository: gh<_i239.AdminRepository>()));
    gh.lazySingleton<_i102.AuthService>(() => _i102.AuthService(
          gh<_i59.FirebaseAuth>(),
          gh<_i806.FacebookAuth>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i507.StudentProgressRepository>(() =>
        _i1056.StudentProgressRepositoryImpl(
            studentProgressRemoteDataSource:
                gh<_i53.StudentProgressRemoteDataSource>()));
    gh.lazySingleton<_i882.PaymentRepository>(() => _i704.PaymentRepositoryImpl(
        remoteDataSource: gh<_i739.PaymentRemoteDataSource>()));
    gh.factory<_i725.SessionConfirmationCubit>(
        () => _i725.SessionConfirmationCubit(
              gh<_i506.CompleteSessionUseCase>(),
              gh<_i275.GetLastPageBySessionIdUseCase>(),
            ));
    gh.lazySingleton<_i338.ReciterKhitmaProgressRemoteDataSource>(() =>
        _i338.ReciterKhitmaProgressRemoteDataSourceImp(
            gh<_i503.RetrofitClient>()));
    gh.lazySingleton<_i484.GetNotificationsUseCase>(() =>
        _i484.GetNotificationsUseCase(
            notificationActionRepository:
                gh<_i116.NotificationActionRepository>()));
    gh.lazySingleton<_i727.MarkNotificationAsReadUseCase>(() =>
        _i727.MarkNotificationAsReadUseCase(
            notificationActionRepository:
                gh<_i116.NotificationActionRepository>()));
    gh.lazySingleton<_i118.MarkAllNotificationsAsRead>(() =>
        _i118.MarkAllNotificationsAsRead(
            notificationActionRepository:
                gh<_i116.NotificationActionRepository>()));
    gh.lazySingleton<_i1021.GetActionsCenterUseCase>(() =>
        _i1021.GetActionsCenterUseCase(
            notificationActionRepository:
                gh<_i116.NotificationActionRepository>()));
    gh.lazySingleton<_i932.GetStudentStatisticsUseCase>(() =>
        _i932.GetStudentStatisticsUseCase(
            studentProgressRepository: gh<_i507.StudentProgressRepository>()));
    gh.lazySingleton<_i666.UserRepository>(() => _i168.UserRepositoryImpl(
        userRemoteDataSource: gh<_i295.UserRemoteDataSource>()));
    gh.lazySingleton<_i970.AuthRepository>(() => _i848.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i30.AuthRemoteDataSource>()));
    gh.lazySingleton<_i522.ReciterRegistrationRepository>(() =>
        _i843.ReciterRegistrationRepositoryImpl(
            reciterRegistrationRemoteDataSource:
                gh<_i1039.ReciterRegistrationRemoteDataSource>()));
    gh.lazySingleton<_i146.MeetingRepository>(() => _i836.MeetingRepositoryImpl(
        meetingRemoreDatasource: gh<_i78.MeetingRemoreDatasource>()));
    gh.factory<_i839.NotificationCubit>(() => _i839.NotificationCubit(
          gh<_i484.GetNotificationsUseCase>(),
          gh<_i727.MarkNotificationAsReadUseCase>(),
          gh<_i118.MarkAllNotificationsAsRead>(),
        ));
    gh.lazySingleton<_i81.AddExtraSessionUseCase>(() =>
        _i81.AddExtraSessionUseCase(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i930.RescheduleSessionOnceUseCase>(() =>
        _i930.RescheduleSessionOnceUseCase(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i735.RescheduleRecuuringSessionsUseCase>(() =>
        _i735.RescheduleRecuuringSessionsUseCase(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i362.GetStudentScheduleTimes>(() =>
        _i362.GetStudentScheduleTimes(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i801.MakeupSessionUseCase>(() =>
        _i801.MakeupSessionUseCase(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i204.GetStudentMySchedule>(() =>
        _i204.GetStudentMySchedule(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i53.CancelSessionUseCase>(() => _i53.CancelSessionUseCase(
        studentMyScheduleRepository: gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i601.ValidateSessionCancellationUseCase>(() =>
        _i601.ValidateSessionCancellationUseCase(
            studentMyScheduleRepository:
                gh<_i815.StudentMyScheduleRepository>()));
    gh.lazySingleton<_i1070.GenerateMeetingLinkUseCase>(() =>
        _i1070.GenerateMeetingLinkUseCase(
            meetingRepository: gh<_i146.MeetingRepository>()));
    gh.lazySingleton<_i725.IsMeetingRunningUseCase>(() =>
        _i725.IsMeetingRunningUseCase(
            meetingRepository: gh<_i146.MeetingRepository>()));
    gh.factory<_i1004.GetSanadMinhajProgressUseCase>(
        () => _i1004.GetSanadMinhajProgressUseCase(gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i518.AddSessionTokenUseCase>(() =>
        _i518.AddSessionTokenUseCase(
            sessionTokenRepository: gh<_i41.SessionTokenRepository>()));
    gh.lazySingleton<_i267.AppCubit>(() => _i267.AppCubit(
          gh<_i127.LocalizationService>(),
          gh<_i266.AppPreferences>(),
        ));
    gh.lazySingleton<_i601.GetLookUpsDataUseCase>(() =>
        _i601.GetLookUpsDataUseCase(
            lookupRepository: gh<_i972.LookupRepository>()));
    gh.lazySingleton<_i618.ReciterCompleteRegistrationUseCase>(() =>
        _i618.ReciterCompleteRegistrationUseCase(
            reciterRegistrationRepository:
                gh<_i522.ReciterRegistrationRepository>()));
    gh.lazySingleton<_i557.ReciterRegistrationUseCase>(() =>
        _i557.ReciterRegistrationUseCase(
            reciterRegistrationRepository:
                gh<_i522.ReciterRegistrationRepository>()));
    gh.lazySingleton<_i175.ValidateReciterSubmitJobStep1UseCase>(() =>
        _i175.ValidateReciterSubmitJobStep1UseCase(
            reciterRegistrationRepository:
                gh<_i522.ReciterRegistrationRepository>()));
    gh.lazySingleton<_i46.GetSubscriptionIdUseCase>(() =>
        _i46.GetSubscriptionIdUseCase(
            skillsNotesRepository: gh<_i696.SkillsNotesRepository>()));
    gh.lazySingleton<_i1067.GetAllBookmarksUseCase>(() =>
        _i1067.GetAllBookmarksUseCase(
            skillsNotesRepository: gh<_i696.SkillsNotesRepository>()));
    gh.lazySingleton<_i258.GetAllNotesUseCase>(() => _i258.GetAllNotesUseCase(
        skillsNotesRepository: gh<_i696.SkillsNotesRepository>()));
    gh.lazySingleton<_i731.GetUserSkillsBySubscriptionIdUseCase>(() =>
        _i731.GetUserSkillsBySubscriptionIdUseCase(
            skillsNotesRepository: gh<_i696.SkillsNotesRepository>()));
    gh.lazySingleton<_i31.SubmitReciterAccountSettingsUseCase>(() =>
        _i31.SubmitReciterAccountSettingsUseCase(
            gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i17.GetRecitersUseCase>(() => _i17.GetRecitersUseCase(
        reciterListingRepository: gh<_i127.ReciterListingRepository>()));
    gh.lazySingleton<_i641.UpdateUserSettingsUseCase>(() =>
        _i641.UpdateUserSettingsUseCase(
            userRepository: gh<_i666.UserRepository>()));
    gh.lazySingleton<_i1011.AddDeviceTokenUseCase>(() =>
        _i1011.AddDeviceTokenUseCase(
            userRepository: gh<_i666.UserRepository>()));
    gh.lazySingleton<_i166.GetUserInfoUseCase>(() =>
        _i166.GetUserInfoUseCase(userRepository: gh<_i666.UserRepository>()));
    gh.factory<_i997.ReciterCompleteProfileCubit>(() =>
        _i997.ReciterCompleteProfileCubit(
            gh<_i618.ReciterCompleteRegistrationUseCase>()));
    gh.lazySingleton<_i332.ReciterDetailsRepository>(() =>
        _i263.ReciterDetailsRepositoryImpl(
            reciterDetailsDataSource: gh<_i36.ReciterDetailsDataSource>()));
    gh.lazySingleton<_i872.GetMessagingContactsUseCase>(() =>
        _i872.GetMessagingContactsUseCase(
            messagingRepository: gh<_i937.MessagingRepository>()));
    gh.lazySingleton<_i436.GetMessagingTokenUseCase>(() =>
        _i436.GetMessagingTokenUseCase(
            messagingRepository: gh<_i937.MessagingRepository>()));
    gh.lazySingleton<_i784.MyRequestsRepository>(() =>
        _i3.MyRequestsRepositoryImp(
            myRequestsRemoteDataSource: gh<_i85.MyRequestsRemoteDataSource>()));
    gh.lazySingleton<_i408.SubscriptionRepository>(() =>
        _i487.SubscriptionRepositoryImpl(
            subscriptionRemoteDataSource:
                gh<_i888.SubscriptionRemoteDataSource>()));
    gh.lazySingleton<_i29.GetAnnouncementsUseCase>(() =>
        _i29.GetAnnouncementsUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i725.GetStudentProgressUseCase>(() =>
        _i725.GetStudentProgressUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i877.GetMySessionsUseCase>(() =>
        _i877.GetMySessionsUseCase(homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i195.GetAllReciterStudentsUseCase>(() =>
        _i195.GetAllReciterStudentsUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i289.GetGlobalRecitersSectionUseCase>(() =>
        _i289.GetGlobalRecitersSectionUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i213.GetSliderContentUseCase>(() =>
        _i213.GetSliderContentUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i603.GetAllProgramsUseCase>(() =>
        _i603.GetAllProgramsUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i786.GetCurrentlySessionsUseCase>(() =>
        _i786.GetCurrentlySessionsUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.lazySingleton<_i519.GetHomeSectionsUseCase>(() =>
        _i519.GetHomeSectionsUseCase(
            homeRepository: gh<_i954.HomeRepository>()));
    gh.factory<_i496.SessionDetailsCubit>(() => _i496.SessionDetailsCubit(
          gh<_i439.GetSessionDetailsBySessionIdUseCase>(),
          gh<_i266.AppPreferences>(),
        ));
    gh.factory<_i782.StudentStatisticsCubit>(() =>
        _i782.StudentStatisticsCubit(gh<_i932.GetStudentStatisticsUseCase>()));
    gh.factory<_i692.ReciterStudentCubit>(() =>
        _i692.ReciterStudentCubit(gh<_i195.GetAllReciterStudentsUseCase>()));
    gh.factory<_i168.ReciterSubmitJobCubit>(() => _i168.ReciterSubmitJobCubit(
          gh<_i557.ReciterRegistrationUseCase>(),
          gh<_i175.ValidateReciterSubmitJobStep1UseCase>(),
        ));
    gh.lazySingleton<_i554.TimeAgoCustomMessages>(
        () => _i554.TimeAgoCustomMessages(gh<_i266.AppPreferences>()));
    gh.lazySingleton<_i612.SubmitStudentAccountSettingsUseCase>(() =>
        _i612.SubmitStudentAccountSettingsUseCase(
            repository: gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i875.ReciterAccountDeleteRequestUseCase>(() =>
        _i875.ReciterAccountDeleteRequestUseCase(
            repository: gh<_i625.AccountSettingsRepository>()));
    gh.lazySingleton<_i199.ReciterKhitmaProgressRepository>(() =>
        _i456.ReciterKhitmaProgressRepositoryImpl(
            reciterKhitmaProgressRemoteDataSource:
                gh<_i338.ReciterKhitmaProgressRemoteDataSource>()));
    gh.factory<_i405.GlobalRecitersSectionCubit>(() =>
        _i405.GlobalRecitersSectionCubit(
            gh<_i289.GetGlobalRecitersSectionUseCase>()));
    gh.factory<_i779.HomeSectionsCubit>(
        () => _i779.HomeSectionsCubit(gh<_i519.GetHomeSectionsUseCase>()));
    gh.factory<_i1023.ProgramAvailableTimesCubit>(() =>
        _i1023.ProgramAvailableTimesCubit(
            gh<_i85.GetProgramAvailableTimesUseCase>()));
    gh.factory<_i384.AdminCubit>(() => _i384.AdminCubit(
          gh<_i266.AppPreferences>(),
          gh<_i342.GetAdminConfigUseCase>(),
        ));
    gh.lazySingleton<_i859.GetReciterAvailableTimesUseCase>(() =>
        _i859.GetReciterAvailableTimesUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i1041.DeleteReciterToFavoriteUseCase>(() =>
        _i1041.DeleteReciterToFavoriteUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i149.GetReciterAvailableTimesForLimitUseCase>(() =>
        _i149.GetReciterAvailableTimesForLimitUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i702.SetIsReceivingStudentsUseCase>(() =>
        _i702.SetIsReceivingStudentsUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i64.GetReciterByIdUseCase>(() =>
        _i64.GetReciterByIdUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i571.StudentScheduleSessionUseCase>(() =>
        _i571.StudentScheduleSessionUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i88.ChangeReciterAvailabilityUseCase>(() =>
        _i88.ChangeReciterAvailabilityUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.lazySingleton<_i123.AddReciterToFavoriteUseCase>(() =>
        _i123.AddReciterToFavoriteUseCase(
            reciterDetailsRepository: gh<_i332.ReciterDetailsRepository>()));
    gh.factory<_i414.StudentProgressCubit>(() =>
        _i414.StudentProgressCubit(gh<_i725.GetStudentProgressUseCase>()));
    gh.factory<_i124.StudentMyRecurringSessionsCubit>(() =>
        _i124.StudentMyRecurringSessionsCubit(
            gh<_i362.GetStudentScheduleTimes>()));
    gh.factory<_i498.ActionCenterCubit>(
        () => _i498.ActionCenterCubit(gh<_i1021.GetActionsCenterUseCase>()));
    gh.factory<_i118.NoteCubit>(
        () => _i118.NoteCubit(gh<_i258.GetAllNotesUseCase>()));
    gh.factory<_i1027.StudentRescheduleSessionsCubit>(
        () => _i1027.StudentRescheduleSessionsCubit(
              gh<_i735.RescheduleRecuuringSessionsUseCase>(),
              gh<_i930.RescheduleSessionOnceUseCase>(),
              gh<_i801.MakeupSessionUseCase>(),
              gh<_i53.CancelSessionUseCase>(),
              gh<_i601.ValidateSessionCancellationUseCase>(),
              gh<_i81.AddExtraSessionUseCase>(),
            ));
    gh.factory<_i704.LookupCubit>(() => _i704.LookupCubit(
          gh<_i601.GetLookUpsDataUseCase>(),
          gh<_i266.AppPreferences>(),
        ));
    gh.factory<_i864.AccountSettingsCubit>(() => _i864.AccountSettingsCubit(
          gh<_i495.DeleteAccountUseCase>(),
          gh<_i928.KhitmaSuspensionUseCase>(),
          gh<_i836.ChangePasswordUseCase>(),
          gh<_i875.ReciterAccountDeleteRequestUseCase>(),
          gh<_i612.SubmitStudentAccountSettingsUseCase>(),
          gh<_i31.SubmitReciterAccountSettingsUseCase>(),
          gh<_i266.AppPreferences>(),
          gh<_i252.ImagePickerService>(),
          gh<_i704.LookupCubit>(),
        ));
    gh.factory<_i198.MessagingContactCubit>(() =>
        _i198.MessagingContactCubit(gh<_i872.GetMessagingContactsUseCase>()));
    gh.lazySingleton<_i939.GetReciterStatisticsUseCase>(() =>
        _i939.GetReciterStatisticsUseCase(
            reciterKhitmaProgressRepository:
                gh<_i199.ReciterKhitmaProgressRepository>()));
    gh.lazySingleton<_i596.SignUpUseCase>(
        () => _i596.SignUpUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i37.SignInUseCase>(
        () => _i37.SignInUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i840.ResetPasswordUseCase>(() =>
        _i840.ResetPasswordUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i618.ValidateOtpUseCase>(() =>
        _i618.ValidateOtpUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i1042.SendOtpUseCase>(() =>
        _i1042.SendOtpUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i137.CompleteLoginBySocailUseCase>(() =>
        _i137.CompleteLoginBySocailUseCase(
            authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i697.LoginBySocialUseCase>(() =>
        _i697.LoginBySocialUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.lazySingleton<_i637.VerifyEmailUseCase>(() =>
        _i637.VerifyEmailUseCase(authRepository: gh<_i970.AuthRepository>()));
    gh.factory<_i939.ReciterAvailableTimesCubit>(
        () => _i939.ReciterAvailableTimesCubit(
              gh<_i859.GetReciterAvailableTimesUseCase>(),
              gh<_i149.GetReciterAvailableTimesForLimitUseCase>(),
              gh<_i85.GetProgramAvailableTimesUseCase>(),
              gh<_i88.ChangeReciterAvailabilityUseCase>(),
            ));
    gh.factory<_i320.MessagingCubit>(
        () => _i320.MessagingCubit(gh<_i436.GetMessagingTokenUseCase>()));
    gh.factory<_i500.UserCubit>(() => _i500.UserCubit(
          gh<_i266.AppPreferences>(),
          gh<_i166.GetUserInfoUseCase>(),
          gh<_i1011.AddDeviceTokenUseCase>(),
          gh<_i641.UpdateUserSettingsUseCase>(),
        ));
    gh.factory<_i921.MeetingCubit>(() => _i921.MeetingCubit(
          gh<_i1070.GenerateMeetingLinkUseCase>(),
          gh<_i725.IsMeetingRunningUseCase>(),
        ));
    gh.factory<_i457.StudentMyScheduleCubit>(
        () => _i457.StudentMyScheduleCubit(gh<_i204.GetStudentMySchedule>()));
    gh.factory<_i886.ReciterListingCubit>(
        () => _i886.ReciterListingCubit(gh<_i17.GetRecitersUseCase>()));
    gh.factory<_i337.MySessionsCubit>(() => _i337.MySessionsCubit(
          gh<_i877.GetMySessionsUseCase>(),
          gh<_i786.GetCurrentlySessionsUseCase>(),
        ));
    gh.factory<_i120.ProgramCubit>(
        () => _i120.ProgramCubit(gh<_i603.GetAllProgramsUseCase>()));
    gh.factory<_i1022.SliderContentCubit>(
        () => _i1022.SliderContentCubit(gh<_i213.GetSliderContentUseCase>()));
    gh.lazySingleton<_i723.RejectRequestUseCase>(() =>
        _i723.RejectRequestUseCase(
            myRequestsRepository: gh<_i784.MyRequestsRepository>()));
    gh.lazySingleton<_i138.GetRequestsByIdUseCase>(() =>
        _i138.GetRequestsByIdUseCase(
            myRequestsRepository: gh<_i784.MyRequestsRepository>()));
    gh.lazySingleton<_i602.ApproveRequestUseCase>(() =>
        _i602.ApproveRequestUseCase(
            myRequestsRepository: gh<_i784.MyRequestsRepository>()));
    gh.lazySingleton<_i751.GetMyRequestsUseCase>(() =>
        _i751.GetMyRequestsUseCase(
            myRequestsRepository: gh<_i784.MyRequestsRepository>()));
    gh.lazySingleton<_i218.CancelRequestUseCase>(() =>
        _i218.CancelRequestUseCase(
            myRequestsRepository: gh<_i784.MyRequestsRepository>()));
    gh.factory<_i137.ReciterFavoriteCubit>(() => _i137.ReciterFavoriteCubit(
          gh<_i123.AddReciterToFavoriteUseCase>(),
          gh<_i1041.DeleteReciterToFavoriteUseCase>(),
        ));
    gh.factory<_i845.AnnouncementsCubit>(
        () => _i845.AnnouncementsCubit(gh<_i29.GetAnnouncementsUseCase>()));
    gh.factory<_i411.StudentProfileCubit>(
        () => _i411.StudentProfileCubit(gh<_i166.GetUserInfoUseCase>()));
    gh.factory<_i32.SessionTokenCubit>(
        () => _i32.SessionTokenCubit(gh<_i518.AddSessionTokenUseCase>()));
    gh.factory<_i40.BookmarkCubit>(
        () => _i40.BookmarkCubit(gh<_i1067.GetAllBookmarksUseCase>()));
    gh.factory<_i157.SanadMinhajProgressCubit>(() =>
        _i157.SanadMinhajProgressCubit(
            gh<_i1004.GetSanadMinhajProgressUseCase>()));
    gh.factory<_i703.SkillCubit>(() => _i703.SkillCubit(
          gh<_i46.GetSubscriptionIdUseCase>(),
          gh<_i731.GetUserSkillsBySubscriptionIdUseCase>(),
        ));
    gh.factory<_i1053.AuthCubit>(() => _i1053.AuthCubit(
          gh<_i266.AppPreferences>(),
          gh<_i102.AuthService>(),
          gh<_i596.SignUpUseCase>(),
          gh<_i637.VerifyEmailUseCase>(),
          gh<_i697.LoginBySocialUseCase>(),
          gh<_i137.CompleteLoginBySocailUseCase>(),
          gh<_i37.SignInUseCase>(),
          gh<_i1042.SendOtpUseCase>(),
          gh<_i618.ValidateOtpUseCase>(),
          gh<_i840.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i711.VerifyPhoneNumberUseCase>(() =>
        _i711.VerifyPhoneNumberUseCase(
            subscriptionRepository: gh<_i408.SubscriptionRepository>()));
    gh.lazySingleton<_i420.GetRandomQuranUseCase>(() =>
        _i420.GetRandomQuranUseCase(
            subscriptionRepository: gh<_i408.SubscriptionRepository>()));
    gh.lazySingleton<_i803.StudentSubscriptionUseCase>(() =>
        _i803.StudentSubscriptionUseCase(
            subscriptionRepository: gh<_i408.SubscriptionRepository>()));
    gh.lazySingleton<_i610.ResubmitSubscriptionUseCase>(() =>
        _i610.ResubmitSubscriptionUseCase(
            subscriptionRepository: gh<_i408.SubscriptionRepository>()));
    gh.factory<_i774.ReciterDetailsCubit>(() => _i774.ReciterDetailsCubit(
          gh<_i64.GetReciterByIdUseCase>(),
          gh<_i702.SetIsReceivingStudentsUseCase>(),
        ));
    gh.factory<_i895.MyRequestsCubit>(() => _i895.MyRequestsCubit(
          gh<_i751.GetMyRequestsUseCase>(),
          gh<_i138.GetRequestsByIdUseCase>(),
        ));
    gh.factory<_i487.StudentScheduleSessionCubit>(() =>
        _i487.StudentScheduleSessionCubit(
            gh<_i571.StudentScheduleSessionUseCase>()));
    gh.factory<_i231.SubscriptionCubit>(() => _i231.SubscriptionCubit(
          gh<_i500.UserCubit>(),
          gh<_i803.StudentSubscriptionUseCase>(),
          gh<_i711.VerifyPhoneNumberUseCase>(),
        ));
    gh.factory<_i678.ReciterStatisticsCubit>(() =>
        _i678.ReciterStatisticsCubit(gh<_i939.GetReciterStatisticsUseCase>()));
    gh.factory<_i103.MyRequestsActionsCubit>(() => _i103.MyRequestsActionsCubit(
          gh<_i218.CancelRequestUseCase>(),
          gh<_i723.RejectRequestUseCase>(),
          gh<_i602.ApproveRequestUseCase>(),
        ));
    gh.factory<_i256.GetRandomQuranCubit>(
        () => _i256.GetRandomQuranCubit(gh<_i420.GetRandomQuranUseCase>()));
    return this;
  }
}

class _$AppServiceModel extends _i176.AppServiceModel {}
