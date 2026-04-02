import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../features/account_settings/presentation/pages/account_change_password_page.dart';
import '../../features/account_settings/presentation/pages/account_deletion_page.dart';
import '../../features/account_settings/presentation/pages/account_khitma_suspension_page.dart';
import '../../features/account_settings/presentation/pages/account_personal_information_page.dart';
import '../../features/account_settings/presentation/pages/account_preferences_page.dart';
import '../../features/account_settings/presentation/pages/account_settings_page.dart';
import '../../features/account_settings/presentation/pages/payment_page.dart';
import '../../features/account_settings/presentation/pages/reciter_certificate_and_recitation_page.dart';
import '../../features/auth/presentation/pages/complete_profile_page.dart';
import '../../features/auth/presentation/pages/create_new_password_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/registration_page.dart';
import '../../features/auth/presentation/pages/verification_page.dart';
import '../../features/home/domain/entites/program.dart';
import '../../features/home/presentation/pages/programs_listing_page.dart';
import '../../features/home/presentation/pages/programs_page.dart';
import '../../features/main/presentation/pages/main_page.dart';
import '../../features/messaging/domain/entities/messaging_contact.dart';
import '../../features/messaging/presentation/pages/message_page.dart';
import '../../features/messaging/presentation/pages/messaging_contacts_page.dart';
import '../../features/my_requests/presentation/pages/my_requests_page.dart';
import '../../features/reciter/khitma_progress/presentation/pages/reciter_khitma_progress_page.dart';
import '../../features/reciter/profile/presentation/pages/reciter_profile_page.dart';
import '../../features/session_details/presentation/pages/session_details_page.dart';
import '../../features/session_not_started.dart';
import '../../features/skills_notes/presentation/pages/skills_notes_page.dart';
import '../../features/student/my_progress/presentation/pages/student_my_progress_page.dart';
import '../../features/student/payment/presentation/pages/payment_plan_page.dart';
import '../../features/student/profile/presentation/pages/student_profile_page.dart';
import '../../features/student/rescheduling/domain/entites/session.dart';
import '../../features/student/rescheduling/presentation/pages/student_my_schedule_page.dart';
import '../../features/student/rescheduling/presentation/pages/student_reschedule_session_page.dart';
import '../../features/student/rescheduling/presentation/pages/student_update_schedule_page.dart';
import '../../features/student/rescheduling/presentation/pages/student_add_extra_session_page.dart';
import '../../features/student/scheduling/presentation/pages/reciter_details_page.dart';
import '../../features/session_web_view_page.dart';
import '../../features/student/subscription/data/models/responses/get_student_subscribition_response.dart';
import '../../features/student/subscription/presentation/bloc/subscription/subscription_cubit.dart';
import '../../features/student/subscription/presentation/pages/student_subscription_status_page.dart';
import '../widgets/camera/audio_only_recorder_page.dart';
import '../widgets/camera/camera_image_app_page.dart';
import '../widgets/camera/camera_video_app_page.dart';
import '../../features/reciter/registration/presentation/pages/reciter_complete_profile_page.dart';
import '../../features/reciter/registration/presentation/pages/reciter_submit_job_page.dart';
import '../../features/student/scheduling/presentation/pages/my_available_time_page.dart';
import '../../features/student/scheduling/presentation/pages/reciter_listing_page.dart';
import '../../features/student/subscription/presentation/pages/student_subscription_page.dart';
import '../di/injection.dart';
import '../services/app_preferences.dart';
import '../splash.dart';
import '../widgets/full_page.dart';
import '../widgets/hint_overlay.dart';

part 'app_router.gr.dart';

class AuthGuard implements AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (getIt<AppPreferences>().isLoggedIn()) {
      resolver.next();
    } else {
      router.replaceAll([LoginRoute()]);
    }
  }
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final unAuthenticatedRoutes = [
    SplashRoute.name,
    LoginRoute.name,
    RegistrationRoute.name,
    VerificationRoute.name,
    ForgotPasswordRoute.name,
    CreateNewPasswordRoute.name,
    CompleteProfileRoute.name
  ];

  @override
  get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: MainRoute.page, guards: [AuthGuard()]),
        //
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: CompleteProfileRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: CreateNewPasswordRoute.page),
        //
        AutoRoute(page: CameraImageAppRoute.page),
        AutoRoute(page: CameraVideoAppRoute.page),
        //
        AutoRoute(page: StudentSubscriptionRoute.page),
        //
        AutoRoute(page: ReciterSubmitJobRoute.page),
        AutoRoute(page: ReciterCompleteProfileRoute.page),
        //
        AutoRoute(page: ReciterListingRoute.page),
        AutoRoute(page: ReciterDetailsRoute.page, path: '/reciters/:id'),
        AutoRoute(page: MyAvailableTimeRoute.page),
        //
        AutoRoute(page: StudentMyScheduleRoute.page),
        AutoRoute(page: StudentUpdateScheduleRoute.page),
        AutoRoute(page: StudentRescheduleSessionRoute.page),
        AutoRoute(page: StudentAddExtraSessionRoute.page),
        AutoRoute(page: StudentProfileRoute.page),
        AutoRoute(page: StudentMyProgressRoute.page),
        //
        AutoRoute(page: SessionWebViewRoute.page),
        AutoRoute(page: MyRequestsRoute.page),
        AutoRoute(page: ReciterProfileRoute.page),
        AutoRoute(page: SessionNotStartedRoute.page),
        //
        AutoRoute(page: AccountSettingsRoute.page),
        AutoRoute(page: AccountPersonalInformationRoute.page),
        AutoRoute(page: AccountPreferencesRoute.page),
        AutoRoute(page: AccountKhitmaSuspensionRoute.page),
        AutoRoute(page: AccountChangePasswordRoute.page),
        AutoRoute(page: AccountDeletionRoute.page),
        AutoRoute(page: ProgramsListingRoute.page),
        AutoRoute(page: SessionDetailsRoute.page),
        AutoRoute(page: SkillsNotesRoute.page),
        AutoRoute(page: ReciterKhitmaProgressRoute.page),
        AutoRoute(page: ProgramsRoute.page),
        AutoRoute(page: FullRoute.page),
        AutoRoute(page: MessageRoute.page),
        AutoRoute(page: MessagingContactsRoute.page),
        AutoRoute(page: ReciterCertificatesRoute.page),
        AutoRoute(page: PaymentInformationRoute.page),
        AutoRoute(page: SubscriptionRoute.page),
        AutoRoute(page: PaymentPlansRoute.page, path: '/payment-plans/'),
        CustomRoute(
            page: HintOverlayRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 300,
            opaque: false),
        // workaround for fixing deep links while app is already running https://github.com/Milad-Akarie/auto_route_library/issues/1722
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}
