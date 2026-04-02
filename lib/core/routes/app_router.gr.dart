// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountChangePasswordPage(),
      );
    },
    AccountDeletionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountDeletionPage(),
      );
    },
    AccountKhitmaSuspensionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountKhitmaSuspensionPage(),
      );
    },
    AccountPersonalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPersonalInformationPage(),
      );
    },
    AccountPreferencesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPreferencesPage(),
      );
    },
    AccountSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountSettingsPage(),
      );
    },
    AudioOnlyRecorderRoute.name: (routeData) {
      final args = routeData.argsAs<AudioOnlyRecorderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AudioOnlyRecorderPage(
          key: args.key,
          widgets: args.widgets,
          timerCount: args.timerCount,
          timerCountInString: args.timerCountInString,
          withTimer: args.withTimer,
          onCancel: args.onCancel,
          setStartRecording: args.setStartRecording,
          minTimeToStopRecording: args.minTimeToStopRecording,
        ),
      );
    },
    CameraImageAppRoute.name: (routeData) {
      final args = routeData.argsAs<CameraImageAppRouteArgs>(
          orElse: () => const CameraImageAppRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CameraImageAppPage(
          key: args.key,
          navigateToImageEditor: args.navigateToImageEditor,
        ),
      );
    },
    CameraVideoAppRoute.name: (routeData) {
      final args = routeData.argsAs<CameraVideoAppRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CameraVideoAppPage(
          key: args.key,
          widgets: args.widgets,
          timerCount: args.timerCount,
          timerCountInString: args.timerCountInString,
          withTimer: args.withTimer,
          cameraTop: args.cameraTop,
          cameraBottom: args.cameraBottom,
          onCancel: args.onCancel,
          withDecoration: args.withDecoration,
          setStartRecording: args.setStartRecording,
          minTimeToStopRecording: args.minTimeToStopRecording,
        ),
      );
    },
    CompleteProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompleteProfilePage(),
      );
    },
    CreateNewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateNewPasswordPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    FullRoute.name: (routeData) {
      final args = routeData.argsAs<FullRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FullPage(
          key: args.key,
          url: args.url,
          showBackBtn: args.showBackBtn,
          onLoadStop: args.onLoadStop,
        ),
      );
    },
    HintOverlayRoute.name: (routeData) {
      final args = routeData.argsAs<HintOverlayRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HintOverlayPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          showSnackbarFn: args.showSnackbarFn,
        ),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainPage(
          key: args.key,
          initialPageIndex: args.initialPageIndex,
        ),
      );
    },
    MessageRoute.name: (routeData) {
      final args = routeData.argsAs<MessageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MessagePage(
          key: args.key,
          conversationId: args.conversationId,
          otherParticipantInfo: args.otherParticipantInfo,
        ),
      );
    },
    MessagingContactsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessagingContactsPage(),
      );
    },
    MyAvailableTimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAvailableTimePage(),
      );
    },
    MyRequestsRoute.name: (routeData) {
      final args = routeData.argsAs<MyRequestsRouteArgs>(
          orElse: () => const MyRequestsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyRequestsPage(
          key: args.key,
          initialRequestId: args.initialRequestId,
        ),
      );
    },
    PaymentInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentInformationPage(),
      );
    },
    PaymentPlansRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentPlansRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentPlansPage(
          key: args.key,
          subscriptionModel: args.subscriptionModel,
        ),
      );
    },
    ProgramsListingRoute.name: (routeData) {
      final args = routeData.argsAs<ProgramsListingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProgramsListingPage(
          key: args.key,
          program: args.program,
        ),
      );
    },
    ProgramsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgramsPage(),
      );
    },
    ReciterCertificatesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterCertificatesPage(),
      );
    },
    ReciterCompleteProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterCompleteProfilePage(),
      );
    },
    ReciterDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ReciterDetailsRouteArgs>(
          orElse: () =>
              ReciterDetailsRouteArgs(reciterId: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReciterDetailsPage(
          key: args.key,
          reciterId: args.reciterId,
          isLiveSession: args.isLiveSession,
          subscriptionCubit: args.subscriptionCubit,
        ),
      );
    },
    ReciterKhitmaProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterKhitmaProgressPage(),
      );
    },
    ReciterListingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterListingPage(),
      );
    },
    ReciterProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterProfilePage(),
      );
    },
    ReciterSubmitJobRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReciterSubmitJobPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationPage(),
      );
    },
    SessionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SessionDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SessionDetailsPage(
          key: args.key,
          sessionId: args.sessionId,
          sessions: args.sessions,
          firstSessionIndex: args.firstSessionIndex,
        ),
      );
    },
    SessionNotStartedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SessionNotStartedScreen(),
      );
    },
    SessionWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<SessionWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SessionWebViewPage(
          key: args.key,
          url: args.url,
          guid: args.guid,
        ),
      );
    },
    SkillsNotesRoute.name: (routeData) {
      final args = routeData.argsAs<SkillsNotesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SkillsNotesPage(
          key: args.key,
          sessionId: args.sessionId,
          studentId: args.studentId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StudentAddExtraSessionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentAddExtraSessionPage(),
      );
    },
    StudentMyProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentMyProgressPage(),
      );
    },
    StudentMyScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentMySchedulePage(),
      );
    },
    StudentProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentProfileRouteArgs>(
          orElse: () => const StudentProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentProfilePage(
          key: args.key,
          fromStudentSide: args.fromStudentSide,
          studentId: args.studentId,
        ),
      );
    },
    StudentRescheduleSessionRoute.name: (routeData) {
      final args = routeData.argsAs<StudentRescheduleSessionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentRescheduleSessionPage(
          key: args.key,
          session: args.session,
          isComingSession: args.isComingSession,
        ),
      );
    },
    StudentSubscriptionRoute.name: (routeData) {
      final args = routeData.argsAs<StudentSubscriptionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentSubscriptionPage(
          key: args.key,
          programId: args.programId,
          initialStepIndex: args.initialStepIndex,
          isResubmit: args.isResubmit,
          isVideoRejection: args.isVideoRejection,
          subscriptionCubit: args.subscriptionCubit,
        ),
      );
    },
    StudentUpdateScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentUpdateScheduleRouteArgs>(
          orElse: () => const StudentUpdateScheduleRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentUpdateSchedulePage(
          key: args.key,
          fromStudentSide: args.fromStudentSide,
        ),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscriptionPage(),
      );
    },
    VerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerificationPage(),
      );
    },
  };
}

/// generated route for
/// [AccountChangePasswordPage]
class AccountChangePasswordRoute extends PageRouteInfo<void> {
  const AccountChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          AccountChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountDeletionPage]
class AccountDeletionRoute extends PageRouteInfo<void> {
  const AccountDeletionRoute({List<PageRouteInfo>? children})
      : super(
          AccountDeletionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDeletionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountKhitmaSuspensionPage]
class AccountKhitmaSuspensionRoute extends PageRouteInfo<void> {
  const AccountKhitmaSuspensionRoute({List<PageRouteInfo>? children})
      : super(
          AccountKhitmaSuspensionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountKhitmaSuspensionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPersonalInformationPage]
class AccountPersonalInformationRoute extends PageRouteInfo<void> {
  const AccountPersonalInformationRoute({List<PageRouteInfo>? children})
      : super(
          AccountPersonalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountPersonalInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPreferencesPage]
class AccountPreferencesRoute extends PageRouteInfo<void> {
  const AccountPreferencesRoute({List<PageRouteInfo>? children})
      : super(
          AccountPreferencesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountPreferencesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountSettingsPage]
class AccountSettingsRoute extends PageRouteInfo<void> {
  const AccountSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AccountSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AudioOnlyRecorderPage]
class AudioOnlyRecorderRoute extends PageRouteInfo<AudioOnlyRecorderRouteArgs> {
  AudioOnlyRecorderRoute({
    Key? key,
    required List<Widget> widgets,
    Duration? timerCount,
    String? timerCountInString,
    required bool withTimer,
    void Function()? onCancel,
    void Function()? setStartRecording,
    int minTimeToStopRecording = 0,
    List<PageRouteInfo>? children,
  }) : super(
          AudioOnlyRecorderRoute.name,
          args: AudioOnlyRecorderRouteArgs(
            key: key,
            widgets: widgets,
            timerCount: timerCount,
            timerCountInString: timerCountInString,
            withTimer: withTimer,
            onCancel: onCancel,
            setStartRecording: setStartRecording,
            minTimeToStopRecording: minTimeToStopRecording,
          ),
          initialChildren: children,
        );

  static const String name = 'AudioOnlyRecorderRoute';

  static const PageInfo<AudioOnlyRecorderRouteArgs> page =
      PageInfo<AudioOnlyRecorderRouteArgs>(name);
}

class AudioOnlyRecorderRouteArgs {
  const AudioOnlyRecorderRouteArgs({
    this.key,
    required this.widgets,
    this.timerCount,
    this.timerCountInString,
    required this.withTimer,
    this.onCancel,
    this.setStartRecording,
    this.minTimeToStopRecording = 0,
  });

  final Key? key;

  final List<Widget> widgets;

  final Duration? timerCount;

  final String? timerCountInString;

  final bool withTimer;

  final void Function()? onCancel;

  final void Function()? setStartRecording;

  final int minTimeToStopRecording;

  @override
  String toString() {
    return 'AudioOnlyRecorderRouteArgs{key: $key, widgets: $widgets, timerCount: $timerCount, timerCountInString: $timerCountInString, withTimer: $withTimer, onCancel: $onCancel, setStartRecording: $setStartRecording, minTimeToStopRecording: $minTimeToStopRecording}';
  }
}

/// generated route for
/// [CameraImageAppPage]
class CameraImageAppRoute extends PageRouteInfo<CameraImageAppRouteArgs> {
  CameraImageAppRoute({
    Key? key,
    bool navigateToImageEditor = false,
    List<PageRouteInfo>? children,
  }) : super(
          CameraImageAppRoute.name,
          args: CameraImageAppRouteArgs(
            key: key,
            navigateToImageEditor: navigateToImageEditor,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraImageAppRoute';

  static const PageInfo<CameraImageAppRouteArgs> page =
      PageInfo<CameraImageAppRouteArgs>(name);
}

class CameraImageAppRouteArgs {
  const CameraImageAppRouteArgs({
    this.key,
    this.navigateToImageEditor = false,
  });

  final Key? key;

  final bool navigateToImageEditor;

  @override
  String toString() {
    return 'CameraImageAppRouteArgs{key: $key, navigateToImageEditor: $navigateToImageEditor}';
  }
}

/// generated route for
/// [CameraVideoAppPage]
class CameraVideoAppRoute extends PageRouteInfo<CameraVideoAppRouteArgs> {
  CameraVideoAppRoute({
    Key? key,
    required List<Widget> widgets,
    Duration? timerCount,
    String? timerCountInString,
    required bool withTimer,
    double? cameraTop,
    double? cameraBottom,
    void Function()? onCancel,
    required bool withDecoration,
    void Function()? setStartRecording,
    int minTimeToStopRecording = 0,
    List<PageRouteInfo>? children,
  }) : super(
          CameraVideoAppRoute.name,
          args: CameraVideoAppRouteArgs(
            key: key,
            widgets: widgets,
            timerCount: timerCount,
            timerCountInString: timerCountInString,
            withTimer: withTimer,
            cameraTop: cameraTop,
            cameraBottom: cameraBottom,
            onCancel: onCancel,
            withDecoration: withDecoration,
            setStartRecording: setStartRecording,
            minTimeToStopRecording: minTimeToStopRecording,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraVideoAppRoute';

  static const PageInfo<CameraVideoAppRouteArgs> page =
      PageInfo<CameraVideoAppRouteArgs>(name);
}

class CameraVideoAppRouteArgs {
  const CameraVideoAppRouteArgs({
    this.key,
    required this.widgets,
    this.timerCount,
    this.timerCountInString,
    required this.withTimer,
    this.cameraTop,
    this.cameraBottom,
    this.onCancel,
    required this.withDecoration,
    this.setStartRecording,
    this.minTimeToStopRecording = 0,
  });

  final Key? key;

  final List<Widget> widgets;

  final Duration? timerCount;

  final String? timerCountInString;

  final bool withTimer;

  final double? cameraTop;

  final double? cameraBottom;

  final void Function()? onCancel;

  final bool withDecoration;

  final void Function()? setStartRecording;

  final int minTimeToStopRecording;

  @override
  String toString() {
    return 'CameraVideoAppRouteArgs{key: $key, widgets: $widgets, timerCount: $timerCount, timerCountInString: $timerCountInString, withTimer: $withTimer, cameraTop: $cameraTop, cameraBottom: $cameraBottom, onCancel: $onCancel, withDecoration: $withDecoration, setStartRecording: $setStartRecording, minTimeToStopRecording: $minTimeToStopRecording}';
  }
}

/// generated route for
/// [CompleteProfilePage]
class CompleteProfileRoute extends PageRouteInfo<void> {
  const CompleteProfileRoute({List<PageRouteInfo>? children})
      : super(
          CompleteProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateNewPasswordPage]
class CreateNewPasswordRoute extends PageRouteInfo<void> {
  const CreateNewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          CreateNewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FullPage]
class FullRoute extends PageRouteInfo<FullRouteArgs> {
  FullRoute({
    Key? key,
    required String url,
    bool showBackBtn = true,
    void Function(
      InAppWebViewController,
      WebUri?,
    )? onLoadStop,
    List<PageRouteInfo>? children,
  }) : super(
          FullRoute.name,
          args: FullRouteArgs(
            key: key,
            url: url,
            showBackBtn: showBackBtn,
            onLoadStop: onLoadStop,
          ),
          initialChildren: children,
        );

  static const String name = 'FullRoute';

  static const PageInfo<FullRouteArgs> page = PageInfo<FullRouteArgs>(name);
}

class FullRouteArgs {
  const FullRouteArgs({
    this.key,
    required this.url,
    this.showBackBtn = true,
    this.onLoadStop,
  });

  final Key? key;

  final String url;

  final bool showBackBtn;

  final void Function(
    InAppWebViewController,
    WebUri?,
  )? onLoadStop;

  @override
  String toString() {
    return 'FullRouteArgs{key: $key, url: $url, showBackBtn: $showBackBtn, onLoadStop: $onLoadStop}';
  }
}

/// generated route for
/// [HintOverlayPage]
class HintOverlayRoute extends PageRouteInfo<HintOverlayRouteArgs> {
  HintOverlayRoute({
    Key? key,
    required HintType type,
    List<PageRouteInfo>? children,
  }) : super(
          HintOverlayRoute.name,
          args: HintOverlayRouteArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'HintOverlayRoute';

  static const PageInfo<HintOverlayRouteArgs> page =
      PageInfo<HintOverlayRouteArgs>(name);
}

class HintOverlayRouteArgs {
  const HintOverlayRouteArgs({
    this.key,
    required this.type,
  });

  final Key? key;

  final HintType type;

  @override
  String toString() {
    return 'HintOverlayRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function()? showSnackbarFn,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            showSnackbarFn: showSnackbarFn,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.showSnackbarFn,
  });

  final Key? key;

  final void Function()? showSnackbarFn;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, showSnackbarFn: $showSnackbarFn}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    int initialPageIndex = 2,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            initialPageIndex: initialPageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.initialPageIndex = 2,
  });

  final Key? key;

  final int initialPageIndex;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, initialPageIndex: $initialPageIndex}';
  }
}

/// generated route for
/// [MessagePage]
class MessageRoute extends PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    Key? key,
    String? conversationId,
    required MessagingContact otherParticipantInfo,
    List<PageRouteInfo>? children,
  }) : super(
          MessageRoute.name,
          args: MessageRouteArgs(
            key: key,
            conversationId: conversationId,
            otherParticipantInfo: otherParticipantInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageRoute';

  static const PageInfo<MessageRouteArgs> page =
      PageInfo<MessageRouteArgs>(name);
}

class MessageRouteArgs {
  const MessageRouteArgs({
    this.key,
    this.conversationId,
    required this.otherParticipantInfo,
  });

  final Key? key;

  final String? conversationId;

  final MessagingContact otherParticipantInfo;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, conversationId: $conversationId, otherParticipantInfo: $otherParticipantInfo}';
  }
}

/// generated route for
/// [MessagingContactsPage]
class MessagingContactsRoute extends PageRouteInfo<void> {
  const MessagingContactsRoute({List<PageRouteInfo>? children})
      : super(
          MessagingContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessagingContactsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAvailableTimePage]
class MyAvailableTimeRoute extends PageRouteInfo<void> {
  const MyAvailableTimeRoute({List<PageRouteInfo>? children})
      : super(
          MyAvailableTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAvailableTimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyRequestsPage]
class MyRequestsRoute extends PageRouteInfo<MyRequestsRouteArgs> {
  MyRequestsRoute({
    Key? key,
    int? initialRequestId,
    List<PageRouteInfo>? children,
  }) : super(
          MyRequestsRoute.name,
          args: MyRequestsRouteArgs(
            key: key,
            initialRequestId: initialRequestId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyRequestsRoute';

  static const PageInfo<MyRequestsRouteArgs> page =
      PageInfo<MyRequestsRouteArgs>(name);
}

class MyRequestsRouteArgs {
  const MyRequestsRouteArgs({
    this.key,
    this.initialRequestId,
  });

  final Key? key;

  final int? initialRequestId;

  @override
  String toString() {
    return 'MyRequestsRouteArgs{key: $key, initialRequestId: $initialRequestId}';
  }
}

/// generated route for
/// [PaymentInformationPage]
class PaymentInformationRoute extends PageRouteInfo<void> {
  const PaymentInformationRoute({List<PageRouteInfo>? children})
      : super(
          PaymentInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentPlansPage]
class PaymentPlansRoute extends PageRouteInfo<PaymentPlansRouteArgs> {
  PaymentPlansRoute({
    Key? key,
    required SubscriptionModel subscriptionModel,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentPlansRoute.name,
          args: PaymentPlansRouteArgs(
            key: key,
            subscriptionModel: subscriptionModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentPlansRoute';

  static const PageInfo<PaymentPlansRouteArgs> page =
      PageInfo<PaymentPlansRouteArgs>(name);
}

class PaymentPlansRouteArgs {
  const PaymentPlansRouteArgs({
    this.key,
    required this.subscriptionModel,
  });

  final Key? key;

  final SubscriptionModel subscriptionModel;

  @override
  String toString() {
    return 'PaymentPlansRouteArgs{key: $key, subscriptionModel: $subscriptionModel}';
  }
}

/// generated route for
/// [ProgramsListingPage]
class ProgramsListingRoute extends PageRouteInfo<ProgramsListingRouteArgs> {
  ProgramsListingRoute({
    Key? key,
    required Program program,
    List<PageRouteInfo>? children,
  }) : super(
          ProgramsListingRoute.name,
          args: ProgramsListingRouteArgs(
            key: key,
            program: program,
          ),
          initialChildren: children,
        );

  static const String name = 'ProgramsListingRoute';

  static const PageInfo<ProgramsListingRouteArgs> page =
      PageInfo<ProgramsListingRouteArgs>(name);
}

class ProgramsListingRouteArgs {
  const ProgramsListingRouteArgs({
    this.key,
    required this.program,
  });

  final Key? key;

  final Program program;

  @override
  String toString() {
    return 'ProgramsListingRouteArgs{key: $key, program: $program}';
  }
}

/// generated route for
/// [ProgramsPage]
class ProgramsRoute extends PageRouteInfo<void> {
  const ProgramsRoute({List<PageRouteInfo>? children})
      : super(
          ProgramsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgramsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterCertificatesPage]
class ReciterCertificatesRoute extends PageRouteInfo<void> {
  const ReciterCertificatesRoute({List<PageRouteInfo>? children})
      : super(
          ReciterCertificatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterCertificatesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterCompleteProfilePage]
class ReciterCompleteProfileRoute extends PageRouteInfo<void> {
  const ReciterCompleteProfileRoute({List<PageRouteInfo>? children})
      : super(
          ReciterCompleteProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterCompleteProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterDetailsPage]
class ReciterDetailsRoute extends PageRouteInfo<ReciterDetailsRouteArgs> {
  ReciterDetailsRoute({
    Key? key,
    required int reciterId,
    bool isLiveSession = false,
    SubscriptionCubit? subscriptionCubit,
    List<PageRouteInfo>? children,
  }) : super(
          ReciterDetailsRoute.name,
          args: ReciterDetailsRouteArgs(
            key: key,
            reciterId: reciterId,
            isLiveSession: isLiveSession,
            subscriptionCubit: subscriptionCubit,
          ),
          rawPathParams: {'id': reciterId},
          initialChildren: children,
        );

  static const String name = 'ReciterDetailsRoute';

  static const PageInfo<ReciterDetailsRouteArgs> page =
      PageInfo<ReciterDetailsRouteArgs>(name);
}

class ReciterDetailsRouteArgs {
  const ReciterDetailsRouteArgs({
    this.key,
    required this.reciterId,
    this.isLiveSession = false,
    this.subscriptionCubit,
  });

  final Key? key;

  final int reciterId;

  final bool isLiveSession;

  final SubscriptionCubit? subscriptionCubit;

  @override
  String toString() {
    return 'ReciterDetailsRouteArgs{key: $key, reciterId: $reciterId, isLiveSession: $isLiveSession, subscriptionCubit: $subscriptionCubit}';
  }
}

/// generated route for
/// [ReciterKhitmaProgressPage]
class ReciterKhitmaProgressRoute extends PageRouteInfo<void> {
  const ReciterKhitmaProgressRoute({List<PageRouteInfo>? children})
      : super(
          ReciterKhitmaProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterKhitmaProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterListingPage]
class ReciterListingRoute extends PageRouteInfo<void> {
  const ReciterListingRoute({List<PageRouteInfo>? children})
      : super(
          ReciterListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterListingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterProfilePage]
class ReciterProfileRoute extends PageRouteInfo<void> {
  const ReciterProfileRoute({List<PageRouteInfo>? children})
      : super(
          ReciterProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReciterSubmitJobPage]
class ReciterSubmitJobRoute extends PageRouteInfo<void> {
  const ReciterSubmitJobRoute({List<PageRouteInfo>? children})
      : super(
          ReciterSubmitJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReciterSubmitJobRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SessionDetailsPage]
class SessionDetailsRoute extends PageRouteInfo<SessionDetailsRouteArgs> {
  SessionDetailsRoute({
    Key? key,
    required String sessionId,
    List<Session>? sessions,
    int? firstSessionIndex,
    List<PageRouteInfo>? children,
  }) : super(
          SessionDetailsRoute.name,
          args: SessionDetailsRouteArgs(
            key: key,
            sessionId: sessionId,
            sessions: sessions,
            firstSessionIndex: firstSessionIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionDetailsRoute';

  static const PageInfo<SessionDetailsRouteArgs> page =
      PageInfo<SessionDetailsRouteArgs>(name);
}

class SessionDetailsRouteArgs {
  const SessionDetailsRouteArgs({
    this.key,
    required this.sessionId,
    this.sessions,
    this.firstSessionIndex,
  });

  final Key? key;

  final String sessionId;

  final List<Session>? sessions;

  final int? firstSessionIndex;

  @override
  String toString() {
    return 'SessionDetailsRouteArgs{key: $key, sessionId: $sessionId, sessions: $sessions, firstSessionIndex: $firstSessionIndex}';
  }
}

/// generated route for
/// [SessionNotStartedScreen]
class SessionNotStartedRoute extends PageRouteInfo<void> {
  const SessionNotStartedRoute({List<PageRouteInfo>? children})
      : super(
          SessionNotStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionNotStartedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SessionWebViewPage]
class SessionWebViewRoute extends PageRouteInfo<SessionWebViewRouteArgs> {
  SessionWebViewRoute({
    Key? key,
    required String url,
    required String guid,
    List<PageRouteInfo>? children,
  }) : super(
          SessionWebViewRoute.name,
          args: SessionWebViewRouteArgs(
            key: key,
            url: url,
            guid: guid,
          ),
          initialChildren: children,
        );

  static const String name = 'SessionWebViewRoute';

  static const PageInfo<SessionWebViewRouteArgs> page =
      PageInfo<SessionWebViewRouteArgs>(name);
}

class SessionWebViewRouteArgs {
  const SessionWebViewRouteArgs({
    this.key,
    required this.url,
    required this.guid,
  });

  final Key? key;

  final String url;

  final String guid;

  @override
  String toString() {
    return 'SessionWebViewRouteArgs{key: $key, url: $url, guid: $guid}';
  }
}

/// generated route for
/// [SkillsNotesPage]
class SkillsNotesRoute extends PageRouteInfo<SkillsNotesRouteArgs> {
  SkillsNotesRoute({
    Key? key,
    String? sessionId,
    required int studentId,
    List<PageRouteInfo>? children,
  }) : super(
          SkillsNotesRoute.name,
          args: SkillsNotesRouteArgs(
            key: key,
            sessionId: sessionId,
            studentId: studentId,
          ),
          initialChildren: children,
        );

  static const String name = 'SkillsNotesRoute';

  static const PageInfo<SkillsNotesRouteArgs> page =
      PageInfo<SkillsNotesRouteArgs>(name);
}

class SkillsNotesRouteArgs {
  const SkillsNotesRouteArgs({
    this.key,
    this.sessionId,
    required this.studentId,
  });

  final Key? key;

  final String? sessionId;

  final int studentId;

  @override
  String toString() {
    return 'SkillsNotesRouteArgs{key: $key, sessionId: $sessionId, studentId: $studentId}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentAddExtraSessionPage]
class StudentAddExtraSessionRoute extends PageRouteInfo<void> {
  const StudentAddExtraSessionRoute({List<PageRouteInfo>? children})
      : super(
          StudentAddExtraSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentAddExtraSessionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentMyProgressPage]
class StudentMyProgressRoute extends PageRouteInfo<void> {
  const StudentMyProgressRoute({List<PageRouteInfo>? children})
      : super(
          StudentMyProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMyProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentMySchedulePage]
class StudentMyScheduleRoute extends PageRouteInfo<void> {
  const StudentMyScheduleRoute({List<PageRouteInfo>? children})
      : super(
          StudentMyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMyScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProfilePage]
class StudentProfileRoute extends PageRouteInfo<StudentProfileRouteArgs> {
  StudentProfileRoute({
    Key? key,
    bool fromStudentSide = true,
    int? studentId,
    List<PageRouteInfo>? children,
  }) : super(
          StudentProfileRoute.name,
          args: StudentProfileRouteArgs(
            key: key,
            fromStudentSide: fromStudentSide,
            studentId: studentId,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentProfileRoute';

  static const PageInfo<StudentProfileRouteArgs> page =
      PageInfo<StudentProfileRouteArgs>(name);
}

class StudentProfileRouteArgs {
  const StudentProfileRouteArgs({
    this.key,
    this.fromStudentSide = true,
    this.studentId,
  });

  final Key? key;

  final bool fromStudentSide;

  final int? studentId;

  @override
  String toString() {
    return 'StudentProfileRouteArgs{key: $key, fromStudentSide: $fromStudentSide, studentId: $studentId}';
  }
}

/// generated route for
/// [StudentRescheduleSessionPage]
class StudentRescheduleSessionRoute
    extends PageRouteInfo<StudentRescheduleSessionRouteArgs> {
  StudentRescheduleSessionRoute({
    Key? key,
    required Session session,
    required bool isComingSession,
    List<PageRouteInfo>? children,
  }) : super(
          StudentRescheduleSessionRoute.name,
          args: StudentRescheduleSessionRouteArgs(
            key: key,
            session: session,
            isComingSession: isComingSession,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentRescheduleSessionRoute';

  static const PageInfo<StudentRescheduleSessionRouteArgs> page =
      PageInfo<StudentRescheduleSessionRouteArgs>(name);
}

class StudentRescheduleSessionRouteArgs {
  const StudentRescheduleSessionRouteArgs({
    this.key,
    required this.session,
    required this.isComingSession,
  });

  final Key? key;

  final Session session;

  final bool isComingSession;

  @override
  String toString() {
    return 'StudentRescheduleSessionRouteArgs{key: $key, session: $session, isComingSession: $isComingSession}';
  }
}

/// generated route for
/// [StudentSubscriptionPage]
class StudentSubscriptionRoute
    extends PageRouteInfo<StudentSubscriptionRouteArgs> {
  StudentSubscriptionRoute({
    Key? key,
    required int programId,
    int initialStepIndex = 1,
    bool isResubmit = false,
    required bool isVideoRejection,
    required SubscriptionCubit subscriptionCubit,
    List<PageRouteInfo>? children,
  }) : super(
          StudentSubscriptionRoute.name,
          args: StudentSubscriptionRouteArgs(
            key: key,
            programId: programId,
            initialStepIndex: initialStepIndex,
            isResubmit: isResubmit,
            isVideoRejection: isVideoRejection,
            subscriptionCubit: subscriptionCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentSubscriptionRoute';

  static const PageInfo<StudentSubscriptionRouteArgs> page =
      PageInfo<StudentSubscriptionRouteArgs>(name);
}

class StudentSubscriptionRouteArgs {
  const StudentSubscriptionRouteArgs({
    this.key,
    required this.programId,
    this.initialStepIndex = 1,
    this.isResubmit = false,
    required this.isVideoRejection,
    required this.subscriptionCubit,
  });

  final Key? key;

  final int programId;

  final int initialStepIndex;

  final bool isResubmit;

  final bool isVideoRejection;

  final SubscriptionCubit subscriptionCubit;

  @override
  String toString() {
    return 'StudentSubscriptionRouteArgs{key: $key, programId: $programId, initialStepIndex: $initialStepIndex, isResubmit: $isResubmit, isVideoRejection: $isVideoRejection, subscriptionCubit: $subscriptionCubit}';
  }
}

/// generated route for
/// [StudentUpdateSchedulePage]
class StudentUpdateScheduleRoute
    extends PageRouteInfo<StudentUpdateScheduleRouteArgs> {
  StudentUpdateScheduleRoute({
    Key? key,
    bool fromStudentSide = true,
    List<PageRouteInfo>? children,
  }) : super(
          StudentUpdateScheduleRoute.name,
          args: StudentUpdateScheduleRouteArgs(
            key: key,
            fromStudentSide: fromStudentSide,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentUpdateScheduleRoute';

  static const PageInfo<StudentUpdateScheduleRouteArgs> page =
      PageInfo<StudentUpdateScheduleRouteArgs>(name);
}

class StudentUpdateScheduleRouteArgs {
  const StudentUpdateScheduleRouteArgs({
    this.key,
    this.fromStudentSide = true,
  });

  final Key? key;

  final bool fromStudentSide;

  @override
  String toString() {
    return 'StudentUpdateScheduleRouteArgs{key: $key, fromStudentSide: $fromStudentSide}';
  }
}

/// generated route for
/// [SubscriptionPage]
class SubscriptionRoute extends PageRouteInfo<void> {
  const SubscriptionRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationPage]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
