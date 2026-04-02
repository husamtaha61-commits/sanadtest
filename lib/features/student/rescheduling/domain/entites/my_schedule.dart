import '../../../scheduling/domain/entites/reciter.dart';
import '../../data/models/responses/my_schedule_response.dart';
import 'session.dart';

class MySchedule {
  final Reciter reciterInfo;
  final List<Session> sessions;

  MySchedule({required this.reciterInfo, required this.sessions});

  factory MySchedule.fromResponse(MyScheduleResponse response) => MySchedule(
        reciterInfo: Reciter.fromResponse(response.reciterInfo),
        sessions: response.sessions != null
            ? response.sessions!
                .map((session) => Session.fromResponse(session))
                .toList()
            : [],
      );
}
