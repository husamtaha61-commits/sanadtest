import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/currently_session_response.dart';

part 'currently_session.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class CurrentlySession with _$CurrentlySession {
  const factory CurrentlySession({
    required String sessionId,
    required CurrentlySessionType type,
    required DateTime currentlySessionDateTime,
    required CurrentlySessionStatus currentlySessionStatus,
    required CurrentlySessionStudentInfo currentlySessionStudentInfo,
  }) = _CurrentlySession;

  factory CurrentlySession.fromResponse(CurrentlySessionResponse response) =>
      CurrentlySession(
          sessionId: response.sessionId ?? "",
          type:
              CurrentlySessionType.fromResponse(response.currentlySessionType),
          currentlySessionDateTime: response.currentlySessionDateTime!,
          currentlySessionStatus: CurrentlySessionStatus.fromResponse(
              response.currentlySessionStatus),
          currentlySessionStudentInfo: CurrentlySessionStudentInfo.fromResponse(
              response.currentlySessionStudentInfo));
}

class CurrentlySessionType {
  final int id;
  final String? name;

  CurrentlySessionType({
    required this.id,
    this.name,
  });

  factory CurrentlySessionType.fromResponse(
      CurrentlySessionTypeResponse? response) {
    return CurrentlySessionType(
      id: response?.id ?? 0,
      name: response?.name,
    );
  }
}

class CurrentlySessionStatus {
  final int id;
  final String? name;

  CurrentlySessionStatus({
    required this.id,
    this.name,
  });

  factory CurrentlySessionStatus.fromResponse(
      CurrentlySessionStatusResponse? response) {
    return CurrentlySessionStatus(
      id: response?.id ?? 0,
      name: response?.name,
    );
  }
}

class CurrentlySessionStudentInfo {
  final int id;
  final String? firstName;
  final String? middleName;
  final String? lastName;

  CurrentlySessionStudentInfo(
      {required this.id, this.firstName, this.middleName, this.lastName});

  factory CurrentlySessionStudentInfo.fromResponse(
      CurrentlySessionStudentInfoResponse? response) {
    return CurrentlySessionStudentInfo(
      id: response?.id ?? 0,
      firstName: response?.firstName,
      middleName: response?.middleName,
      lastName: response?.lastName,
    );
  }
}
