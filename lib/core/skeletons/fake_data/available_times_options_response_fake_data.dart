import 'package:skeletonizer/skeletonizer.dart';
import '../../../features/my_requests/data/models/responses/my_requests_response.dart';
import '../../../features/reciter/registration/domain/entities/available_times_options.dart';
import '../../../features/student/rescheduling/domain/entites/session_time_date.dart';

final timeDataFakeData = TimeData(
  dayId: 1,
  timeId: 1,
  userDayId: 1,
  userDayName: BoneMock.name,
  userTimeValue: '03:00',
  isReserved: false,
  dateTime: "2024-10-27T15:00:00Z",
);

final timeSuggestionsFakeDate = TimeSuggestionsResponse(
  suggestionDateTime: DateTime.now(),
  suggestionId: 1,
);

List<SessionTimeDate> generateFakeSessionTimeData(int count) {
  return List<SessionTimeDate>.generate(
      count, (_) => SessionTimeDate(timeDataResponse: timeDataFakeData));
}

List<TimeData> generateFakeTimeData(int count) {
  return List<TimeData>.generate(count, (_) => timeDataFakeData);
}

final availableTimesOptionsFakeData = List<AvailableTimesOptions>.generate(
  3,
  (index) {
    return AvailableTimesOptions(
      userDayId: index + 1,
      times: generateFakeTimeData(5),
    );
  },
);
