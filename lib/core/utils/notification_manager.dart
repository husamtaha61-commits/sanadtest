import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/messaging/domain/entities/messaging_contact.dart';
import '../../features/shared/presentation/bloc/meeting/meeting_cubit.dart';
import '../../features/shared/presentation/bloc/user/user_cubit.dart';
import '../di/injection.dart';
import '../routes/app_router.dart';
import '../services/notification_service.dart';
import 'snackbar.dart';
import 'utils.dart';

enum NotificationType {
  Request,
  UpcomingSession,
  OngoingSession,
  ApprovedSubscription,
  RejectedSubscription,
  MySchedule,
  Unknown
}

abstract class NotificationManager {
  static Future<void> navigateToScreen(
      {String? type,
      RemoteMessage? message,
      bool logShowContentEvent = false,
      BuildContext? context}) async {
    final AppRouter appRouter = getIt<AppRouter>();
    final data = message?.data;

    final notificationType = NotificationType.values.firstWhere(
      (e) => e.name == (type ?? data?["type"]),
      orElse: () =>
          NotificationType.Unknown, // Default to 'Unknown' for invalid types
    );

    try {
      if (message?.isFromTwilio ?? false) {
        appRouter.replaceAll([MainRoute(initialPageIndex: 3)],
            updateExistingRoutes: false);
        return;
      }
      switch (notificationType) {
        case NotificationType.Request:
          appRouter.push(MyRequestsRoute());
          break;

        case NotificationType.UpcomingSession:
          {
            appRouter.replaceAll([MainRoute()], updateExistingRoutes: false);
            if (logShowContentEvent) {
              FacebookAppEvents().logViewContent();
            }
          }
          break;

        case NotificationType.OngoingSession:
          final meetingUrl = data?["url"] as String;
          if (meetingUrl.isNotEmpty) {
            final meetingCubit = getIt<MeetingCubit>();
            final Uri uri = Uri.parse(meetingUrl);
            final guid = uri.queryParameters['tokenGuid'] ?? '';
            if (context != null) {
              showAppLoadingDialog(context);
            }
            final isRunning = await meetingCubit.isMeetingRunning(meetingUrl);

            if (context != null) {
              await appRouter.maybePop();
            }

            if (isRunning) {
              await appRouter
                  .push(SessionWebViewRoute(url: meetingUrl, guid: guid));
            } else {
              appRouter.push(const SessionNotStartedRoute());
            }
          } else {
            showGeneralSnackBarError();
          }
          break;

        case NotificationType.ApprovedSubscription:
          {
            appRouter.replaceAll([MainRoute()], updateExistingRoutes: false);
            if (logShowContentEvent) {
              FacebookAppEvents().logViewContent();
            }
          }
          break;

        case NotificationType.RejectedSubscription:
          appRouter.push(const ProgramsRoute());
          break;

        case NotificationType.MySchedule:
          appRouter.push(const StudentMyScheduleRoute());
          break;

        case NotificationType.Unknown:
          {
            appRouter.replaceAll([MainRoute()],
                updateExistingRoutes: false); // Default
            if (logShowContentEvent) {
              FacebookAppEvents().logViewContent();
            }
          }
      }
    } catch (err) {
      showGeneralSnackBarError();
    }
  }

  /// Navigate to specific Twilio chat when notification is tapped
  static Future<void> navigateToTwilioChat(Map<String, dynamic> payload) async {
    final AppRouter appRouter = getIt<AppRouter>();

    try {
      final conversationSid = payload['conversationSid'] as String?;
      final authorId = payload['authorId'] as int?;
      final firstName = payload['firstName'] as String? ?? '';
      final middleName = payload['middleName'] as String?;
      final lastName = payload['lastName'] as String? ?? '';
      final profileImageUrl = payload['profileImageUrl'] as String?;

      if (conversationSid == null || authorId == null) {
        // Fallback to messaging center if data is missing
        appRouter.replaceAll(
          [MainRoute(initialPageIndex: 3)],
          updateExistingRoutes: false,
        );
        return;
      }

      final otherParticipantInfo = MessagingContact(
        id: authorId,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        profileImageUrl: profileImageUrl,
        conversationId: conversationSid,
      );

      // Navigate to main with messaging tab, then push the specific chat
      await appRouter.replaceAll(
        [
          MainRoute(initialPageIndex: 3),
          MessageRoute(
            conversationId: conversationSid,
            otherParticipantInfo: otherParticipantInfo,
          ),
        ],
        updateExistingRoutes: false,
      );
    } catch (err) {
      // Fallback to messaging center
      appRouter.replaceAll(
        [MainRoute(initialPageIndex: 3)],
        updateExistingRoutes: false,
      );
    }
  }

  static void handleLogic(Map<String, dynamic> data, BuildContext context) {
    final type = data['type'] as String?;
    final notificationType = NotificationType.values.firstWhere(
      (e) => e.name == type,
      orElse: () =>
          NotificationType.Unknown, // Default to 'Unknown' for invalid types
    );

    switch (notificationType) {
      case NotificationType.ApprovedSubscription:
        context.read<UserCubit>().getUserInfo();
        break;

      case NotificationType.MySchedule:
        context.read<UserCubit>().getUserInfo();
        break;

      default:
      //
    }
  }
}
