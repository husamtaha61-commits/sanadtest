import 'dart:async';

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/base_status.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/app_preferences.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_style.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/translations/locale_keys.g.dart';
import '../../../shared/presentation/bloc/meeting/meeting_cubit.dart';
import '../../domain/entites/currently_session.dart';
import '../bloc/my_sessions/my_sessions_cubit.dart';
import 'meeting_provider.dart';

class HomeUpcomingSessionBanner extends StatelessWidget {
  const HomeUpcomingSessionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const MeetingProvider(
      child: _UpcomingSessionBannerContent(),
    );
  }
}

class _UpcomingSessionBannerContent extends StatefulWidget {
  const _UpcomingSessionBannerContent();

  @override
  State<_UpcomingSessionBannerContent> createState() =>
      _UpcomingSessionBannerContentState();
}

class _UpcomingSessionBannerContentState
    extends State<_UpcomingSessionBannerContent> {
  /// Whether the "Go to Session" button is enabled
  bool isButtonEnabled = false;

  /// Whether the current session's countdown has ended (session time started)
  bool currentSessionStarted = false;

  /// Timer to disable button when session ends (60 min after start)
  Timer? sessionEndTimer;

  /// Timer to periodically check session status from API
  Timer? statusCheckTimer;

  /// The session ID we're currently tracking (to detect session changes)
  String? _trackedSessionId;

  /// Session duration in minutes
  static const int sessionDurationMinutes = 60;

  /// Minutes before session start when button becomes enabled
  static const int preJoinMinutes = 6;

  /// Interval to check session status from API
  static const Duration statusCheckInterval = Duration(seconds: 30);

  @override
  void initState() {
    super.initState();
    context.read<MySessionsCubit>().getMyUpCommingSession();
  }

  @override
  void dispose() {
    _cancelAllTimers();
    super.dispose();
  }

  void _cancelAllTimers() {
    sessionEndTimer?.cancel();
    statusCheckTimer?.cancel();
  }

  /// Calculate the session end time (fixed at sessionDateTime + 60 minutes)
  DateTime _getSessionEndTime(CurrentlySession session) {
    return session.currentlySessionDateTime
        .add(const Duration(minutes: sessionDurationMinutes));
  }

  /// Check if we're within the join window (6 min before start to session end)
  bool _isWithinJoinWindow(CurrentlySession session) {
    final now = DateTime.now();
    final joinStartTime = session.currentlySessionDateTime
        .subtract(const Duration(minutes: preJoinMinutes));
    final sessionEndTime = _getSessionEndTime(session);

    return now.isAfter(joinStartTime) && now.isBefore(sessionEndTime);
  }

  /// Check if the session has ended (time-based)
  bool _hasSessionTimedOut(CurrentlySession session) {
    return DateTime.now().isAfter(_getSessionEndTime(session));
  }

  /// Update button state based on current time and session
  void _updateButtonState(CurrentlySession session) {
    if (!mounted) return;

    final isWithinWindow = _isWithinJoinWindow(session);
    final hasTimedOut = _hasSessionTimedOut(session);

    // If session has timed out, trigger end
    if (hasTimedOut) {
      _onSessionEnd();
      return;
    }

    setState(() {
      isButtonEnabled = isWithinWindow;
    });
  }

  /// Called when the countdown timer reaches zero (session start time)
  void _onCountdownEnd(CurrentlySession session) {
    if (!mounted) return;

    // Schedule setState after build phase to avoid calling during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {
        currentSessionStarted = true;
      });

      // Update button state
      _updateButtonState(session);

      // Start periodic status check
      _startStatusCheckTimer(session);

      // Set timer to end session at exactly 60 minutes after start
      final sessionEndTime = _getSessionEndTime(session);
      final timeUntilEnd = sessionEndTime.difference(DateTime.now());

      if (timeUntilEnd.isNegative) {
        // Session already ended
        _onSessionEnd();
      } else {
        sessionEndTimer = Timer(timeUntilEnd, _onSessionEnd);
      }
    });
  }

  /// Called when session ends (either by time or status change)
  void _onSessionEnd() {
    if (!mounted) return;

    // Schedule setState after build phase to avoid calling during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _cancelAllTimers();

      setState(() {
        isButtonEnabled = false;
        currentSessionStarted = false;
        _trackedSessionId = null;
      });

      // Promote next session to current
      context.read<MySessionsCubit>().promoteNextSession();
    });
  }

  /// Start periodic status check timer
  void _startStatusCheckTimer(CurrentlySession session) {
    statusCheckTimer?.cancel();
    statusCheckTimer = Timer.periodic(statusCheckInterval, (_) {
      _checkSessionStatus(session);
    });
  }

  /// Check if session status has changed (e.g., completed early)
  Future<void> _checkSessionStatus(CurrentlySession currentSession) async {
    if (!mounted) return;

    final mySessionsCubit = context.read<MySessionsCubit>();
    final updatedSession = await mySessionsCubit.refreshUpcomingSession();

    if (!mounted) return;

    // If no session or different session, trigger session end
    if (updatedSession == null ||
        updatedSession.sessionId != currentSession.sessionId) {
      _onSessionEnd();
      return;
    }

    // Update button state (time-based check only)
    _updateButtonState(updatedSession);
  }

  /// Setup tracking for a new session
  void _setupSessionTracking(CurrentlySession session) {
    if (_trackedSessionId == session.sessionId) return;

    _cancelAllTimers();
    _trackedSessionId = session.sessionId;

    // Check if session already started
    final now = DateTime.now();
    if (now.isAfter(session.currentlySessionDateTime)) {
      // Session already started
      if (_hasSessionTimedOut(session)) {
        // Session already ended
        Future.microtask(() => _onSessionEnd());
      } else {
        // Session in progress
        setState(() {
          currentSessionStarted = true;
        });
        _onCountdownEnd(session);
      }
    } else {
      // Session hasn't started yet
      setState(() {
        currentSessionStarted = false;
      });
      // Pre-join window check
      _updateButtonState(session);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo header
        Container(
          padding: EdgeInsets.all(20.w),
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.centerStart,
          color: Colors.white,
          child: SvgPicture.asset(
            key: ValueKey(context.locale),
            getIt<AppPreferences>().isAr
                ? Assets.images.logoArColored.path
                : Assets.images.logoEnColored.path,
            width: 113.w,
            height: 42.w,
          ),
        ),
        // Session banner
        // ---------------------------------------- session counter bar ----------------------------------------
        BlocBuilder<MySessionsCubit, MySessionsState>(
          builder: (context, state) {
            if (state.status is! Success || state.firstSession == null) {
              return const SizedBox();
            }

            final CurrentlySession currentSession = state.firstSession!;
            final CurrentlySession? nextSession = state.nextSession;

            // Setup tracking for this session
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _setupSessionTracking(currentSession);
            });

            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              color: AppColors.navyBlue,
              child: Column(
                children: [
                  // Current session row
                  _buildCurrentSessionRow(context, state, currentSession),

                  // Next session preview (shown when first session button is enabled)
                  if (isButtonEnabled && nextSession != null) ...[
                    const Divider(color: AppColors.goldenOrange, height: 20),
                    _buildNextSessionPreview(context, state, nextSession),
                  ],
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCurrentSessionRow(
    BuildContext context,
    MySessionsState state,
    CurrentlySession currentSession,
  ) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Session number and button
          Expanded(
            child: Wrap(
              children: [
                Text(
                  "${context.tr(LocaleKeys.home_sessionBanner_sessionNumber)} ${state.firstSessionIndex + 1}",
                  style: AppTextStyles.font10WhiteW700,
                ),
                BlocListener<MeetingCubit, MeetingState>(
                  listener: (context, meetingState) {
                    final appRouter = getIt<AppRouter>();
                    if (meetingState.status == const BaseStatus.success() &&
                        !meetingState.sessionStarted) {
                      appRouter.push(const SessionNotStartedRoute());
                    }
                  },
                  child: Opacity(
                    opacity: isButtonEnabled ? 1 : 0.5,
                    child: AppElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              context.read<MeetingCubit>().generateMeetingLink(
                                  currentSession.sessionId);
                            }
                          : null,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                      fixedSize: const Size.fromWidth(double.infinity),
                      backgroundColor: AppColors.goldenOrange,
                      foregroundColor: Colors.white,
                      child: const Text(LocaleKeys.button_goToSession).tr(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right side: Timer
          Row(
            children: [
              const VerticalDivider(color: AppColors.goldenOrange),
              12.horizontalSpace,
              Wrap(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 80.w),
                    child: Text(
                      currentSessionStarted
                          ? context.tr(
                              LocaleKeys.home_sessionBanner_sessionInProgress)
                          : context.tr(
                              LocaleKeys.home_sessionBanner_upcomingSession),
                      style: AppTextStyles.font12WhiteW600,
                    ),
                  ),
                  _buildCurrentSessionTimer(context, currentSession),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

// --------------------------------------------------- remaining time / countdown timer ---------------------------------------------------
  Widget _buildCurrentSessionTimer(
      BuildContext context, CurrentlySession session) {
    if (currentSessionStarted) {
      // Show remaining time (counting down from 60 min)
      final sessionEndTime = _getSessionEndTime(session);
      return Directionality(
        key: ValueKey('remaining_${session.sessionId}'),
        textDirection: TextDirection.ltr,
        child: TimerCountdown(
          daysDescription: context.tr(LocaleKeys.times_days),
          hoursDescription: context.tr(LocaleKeys.times_hrs),
          minutesDescription: context.tr(LocaleKeys.times_min),
          secondsDescription: context.tr(LocaleKeys.times_sec),
          spacerWidth: 3.w,
          descriptionTextStyle: AppTextStyles.font8WhiteW300,
          colonsTextStyle: AppTextStyles.font12GoldenOrangeW700,
          timeTextStyle: AppTextStyles.font12GoldenOrangeW700,
          endTime: sessionEndTime,
          onTick: (_) => _updateButtonState(session),
          onEnd: _onSessionEnd,
        ),
      );
    } else {
      // Show countdown to session start
      return Directionality(
        key: ValueKey('countdown_${session.sessionId}'),
        textDirection: TextDirection.ltr,
        child: TimerCountdown(
          daysDescription: context.tr(LocaleKeys.times_days),
          hoursDescription: context.tr(LocaleKeys.times_hrs),
          minutesDescription: context.tr(LocaleKeys.times_min),
          secondsDescription: context.tr(LocaleKeys.times_sec),
          spacerWidth: 3.w,
          descriptionTextStyle: AppTextStyles.font8WhiteW300,
          colonsTextStyle: AppTextStyles.font12GoldenOrangeW700,
          timeTextStyle: AppTextStyles.font12GoldenOrangeW700,
          endTime: session.currentlySessionDateTime,
          onTick: (_) => _updateButtonState(session),
          onEnd: () => _onCountdownEnd(session),
        ),
      );
    }
  }

  Widget _buildNextSessionPreview(
    BuildContext context,
    MySessionsState state,
    CurrentlySession nextSession,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: Next session label
        Text(
          "${context.tr(LocaleKeys.home_sessionBanner_nextSession)} ${state.nextSessionIndex + 1}",
          style: AppTextStyles.font10WhiteW700.copyWith(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        // Right side: Timer
        Row(
          children: [
            Text(
              context.tr(LocaleKeys.home_sessionBanner_startsIn),
              style: AppTextStyles.font10WhiteW700.copyWith(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            8.horizontalSpace,
            Directionality(
              key: ValueKey('next_${nextSession.sessionId}'),
              textDirection: TextDirection.ltr,
              child: TimerCountdown(
                daysDescription: context.tr(LocaleKeys.times_days),
                hoursDescription: context.tr(LocaleKeys.times_hrs),
                minutesDescription: context.tr(LocaleKeys.times_min),
                secondsDescription: context.tr(LocaleKeys.times_sec),
                spacerWidth: 2.w,
                descriptionTextStyle: AppTextStyles.font8WhiteW300.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
                colonsTextStyle: AppTextStyles.font12GoldenOrangeW700.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
                timeTextStyle: AppTextStyles.font12GoldenOrangeW700.copyWith(
                  color: Colors.white.withOpacity(0.7),
                ),
                endTime: nextSession.currentlySessionDateTime,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
