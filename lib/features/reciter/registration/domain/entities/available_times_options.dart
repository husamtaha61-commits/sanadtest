import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/services/app_preferences.dart';
import '../../data/models/responses/available_times_options_response.dart';

part 'available_times_options.freezed.dart';
part 'available_times_options.g.dart';

class AvailableTimesOptions {
  final int userDayId;
  final List<TimeData> times;

  AvailableTimesOptions({
    required this.userDayId,
    required this.times,
  });
}

@Freezed(toJson: false)
class TimeData with _$TimeData {
  const TimeData._();

  const factory TimeData({
    required int userDayId,
    required int dayId,
    required int timeId,
    required String userDayName,
    required String userTimeValue,
    required bool isReserved,
    String? dateTime,
  }) = _TimeData;

  int get uniqueId => dayId * 100 + timeId;

  int dayIdFromUniqueId(int uniqueId) => (uniqueId % 100).floor();

  int hourIdFromUniqueId(int uniqueId) => uniqueId - dayIdFromUniqueId(uniqueId);

  factory TimeData.fromJson(Map<String, dynamic> json) =>
      _$TimeDataFromJson(json);
}

class AvailableTimesProcessor {
  /// Adjusts a custom day ID to Dart's weekday.
  static int adjustFromCustomDayId(int customDayId) =>
      customDayId == 1 ? 7 : customDayId - 1;

  /// Adjusts Dart's weekday to a custom day ID.
  static int adjustToCustomDayId(int weekday) => weekday == 7 ? 1 : weekday + 1;

  /// Converts an `AvailableTimesOptionsResponseV2` instance to a local `DateTime`.
  static DateTime convertToLocalTime(int? dayId, String? timeValue) {
    final timeParts = timeValue?.split(':') ?? ["00", "00"];
    final hour = int.tryParse(timeParts[0]) ?? 0;
    final minute = int.tryParse(timeParts[1]) ?? 0;

    final now = DateTime.now();
    final targetWeekday = adjustFromCustomDayId(dayId ?? 0);
    final dayOffset = targetWeekday - now.weekday;
    final targetDate = now.add(Duration(days: dayOffset));

    final utcDateTime = DateTime.utc(
      targetDate.year,
      targetDate.month,
      targetDate.day,
      hour,
      minute,
    );

    return utcDateTime.toLocal();
  }

  /// Groups and sorts `AvailableTimesOptions` from response data.
  static List<AvailableTimesOptions> fromAvailableTimesOptionsResponseV2(
      List<TimeDataResponse> responses) {
    final grouped = <int, List<TimeData>>{};

    for (var response in responses) {
      final localDateTime =
          convertToLocalTime(response.dayId, response.timeValue);
      final localDayId = adjustToCustomDayId(localDateTime.weekday);
      final userDayName = DateFormat.EEEE(getIt<AppPreferences>().getLang).format(localDateTime);
      final formattedTime = DateFormat('HH:mm').format(localDateTime);

      final timeData = TimeData(
        userDayId: localDayId,
        dayId: response.dayId ?? -1,
        timeId: response.timeId ?? -1,
        userDayName: userDayName,
        userTimeValue: formattedTime,
        isReserved: response.isReserved ?? false,
        dateTime: response.dateTime,
      );

      grouped.putIfAbsent(localDayId, () => []).add(timeData);
    }

    return grouped.entries
        .map((entry) => AvailableTimesOptions(
              userDayId: entry.key,
              times: entry.value
                ..sort((a, b) => a.userTimeValue.compareTo(b.userTimeValue)),
            ))
        .toList();
  }

  /// Converts a list of `TimeDataResponseV2` to `TimeData` objects.
  static List<TimeData> fromTimeDateResponse(List<TimeDataResponse> responses) {
    return responses.map((response) {
      final localDateTime =
          convertToLocalTime(response.dayId, response.timeValue);
      final localDayId = adjustToCustomDayId(localDateTime.weekday);
      final userDayName = DateFormat.EEEE(getIt<AppPreferences>().getLang).format(localDateTime);
      final formattedTime = DateFormat('HH:mm').format(localDateTime);

      return TimeData(
        userDayId: localDayId,
        dayId: response.dayId ?? -1,
        timeId: response.timeId ?? -1,
        userDayName: userDayName,
        userTimeValue: formattedTime,
        isReserved: response.isReserved ?? false,
        dateTime: response.dateTime,
      );
    }).toList();
  }
}
