import 'dart:ui';

import '../../gen/translations/locale_keys.g.dart';
import '../theme/styles/app_colors.dart';

enum LookUpsData {
  language,
  nationality,
  country,
  gender,
  recitation,
  recitationType,
  userIdentityType,
  ageRange,
  requestStatus,
  requestType,
  requesterSide,
  day,
  averageIntervals;

  int get intValue => index + 1;
}

enum UserIdTypes {
  identityCard,
  passport,
  drivingLicense,
  birthCertificate;

  int get intValue => index + 1;
}

enum UserRoles { Student, Reciter } // Capitalize to be consistent with backend

enum Programs {
  sanadIjazah,
  sanadItqan,
  sanadMinhaj;

  int get intValue => index + 1;
}

enum SessionTypes {
  schedule(
    id: 1,
    name: 'Schedule',
    uiName: LocaleKeys
        .student_scheduling_student_rescheduling_mySchedule_sessionTypes_normalSession,
    color: AppColors.navyBlue,
  ),
  rescheduleOnce(
    id: 2,
    name: 'Reschedule Once',
    color: Color(0xffFF8A00),
  ),
  reschedule(
    id: 3,
    name: 'Reschedule',
    uiName: LocaleKeys
        .student_scheduling_student_rescheduling_mySchedule_sessionTypes_rescheduledSession,
    color: AppColors.navyBlue,
  ),
  makeup(
    id: 4,
    name: 'Makeup',
    uiName: LocaleKeys
        .student_scheduling_student_rescheduling_mySchedule_sessionTypes_makeupSession,
    color: Color(0xff1877F2),
  ),
  extra(
    id: 5,
    name: 'Extra',
    uiName: LocaleKeys
        .student_scheduling_student_rescheduling_mySchedule_sessionTypes_extraSession,
    color: AppColors.goldenOrange,
  );

  final int id;
  final String name;
  final String? uiName;
  final Color color;

  const SessionTypes({
    required this.id,
    required this.name,
    this.uiName,
    required this.color,
  });

  static SessionTypes? fromId(int? id) {
    for (var sessionType in SessionTypes.values) {
      if (sessionType.id == id) {
        return sessionType;
      }
    }
    return null;
  }
}

enum SessionStatus {
  upcoming, // id: 1
  completed, // id: 2
  replaced, // id: 3
  cancelled, // id: 4
  incompleted, // id: 5
  pendingCompletion, // id: 6 - Session finished, waiting for admin to mark complete
  suspended; // id: 7

  int get intValue => index + 1;

  static SessionStatus? fromId(int id) => switch (id) {
        1 => upcoming,
        2 => completed,
        3 => replaced,
        4 => cancelled,
        5 => incompleted,
        6 => pendingCompletion,
        7 => suspended,
        int() => null,
      };

  /// Returns true if this session can be joined (only upcoming sessions)
  bool get isJoinable => this == SessionStatus.upcoming;

  /// Returns true if this session has ended and cannot be joined
  /// pendingCompletion is treated as ended (session already happened)
  bool get hasEnded =>
      this == SessionStatus.completed ||
      this == SessionStatus.replaced ||
      this == SessionStatus.cancelled ||
      this == SessionStatus.incompleted ||
      this == SessionStatus.pendingCompletion ||
      this == SessionStatus.suspended;
}

enum SubscriptionStatus {
  pending,
  rejected,
  approved,
  completed,
  certified,
  cancelled,
  suspended;

  static SubscriptionStatus? fromId(int id) => switch (id) {
        1 => pending,
        2 => rejected,
        3 => approved,
        4 => completed,
        5 => certified,
        6 => cancelled,
        7 => suspended,
        int() => null,
      };

  int get intValue => index + 1;

  bool get canSubscribe => this == SubscriptionStatus.rejected;
}

enum Gender {
  male,
  female;

  static Gender? fromId(int id) =>
      switch (id) { 1 => male, 2 => female, int() => null };
  int get intValue => index + 1;
}

enum Language {
  arabic,
  english;

  static Language? fromId(int id) =>
      switch (id) { 1 => arabic, 2 => english, int() => null };
  int get intValue => index + 1;
}

enum SuspensionReason {
  healthCondition,
  maternity,
  travel,
  busy,
  technicalIssue,
  other;

  static SuspensionReason? fromId(int id) => switch (id) {
        1 => healthCondition,
        2 => maternity,
        3 => travel,
        4 => busy,
        5 => technicalIssue,
        6 => other,
        int() => null,
      };

  int get intValue => index + 1;

  String get displayName => switch (this) {
        SuspensionReason.healthCondition => "HealthCondition",
        SuspensionReason.maternity => "Maternity",
        SuspensionReason.travel => "Travel",
        SuspensionReason.busy => "Busy",
        SuspensionReason.technicalIssue => "TechnicalIssue",
        SuspensionReason.other => "Other",
      };
}
