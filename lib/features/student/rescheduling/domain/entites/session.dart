import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/base_field.dart';
import '../../../../session_details/domain/entites/session_details.dart';
import '../../data/models/responses/my_schedule_response.dart';
import 'student_info.dart';
part 'session.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class Session with _$Session {
  const factory Session({
    required String sessionId,
    required BaseField type,
    required DateTime sessionDateTime,
    required BaseField status,
    required StudentInfo studentInfo,
  }) = _Session;

  factory Session.fromResponse(SessionResponse response) => Session(
        sessionId: response.sessionId ?? '',
        type: BaseField.fromResponse(response.type),
        sessionDateTime: response.sessionDateTime ?? DateTime.now(),
        status: BaseField.fromResponse(response.status),
        studentInfo: StudentInfo.fromResponse(response.studentInfo),
      );
  
  factory Session.fromDetails(SessionDetails details) {
    return Session(
        sessionId: details.sessionId,
        type: details.type,
        sessionDateTime: details.sessionDateTime,
        status: details.status,
        studentInfo: StudentInfo.fromDetailsStudentInfo(details.studentInfo)
    );
  }
}
