import 'package:intl/intl.dart';

import '../di/injection.dart';
import '../services/app_preferences.dart';

extension DateTimeExtensions on DateTime {
  String toStr(String newFormat, {bool localized = false}) {
    return DateFormat(
            newFormat, localized ? getIt<AppPreferences>().getLang : null)
        .format(this);
  }

  int diffInYears(DateTime date) {
    return year - date.year;
  }

  DateTime toDateOnlyDateTime() {
    return copyWith(
        hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0);
  }

  String toDateOnly() {
    final mm = month.toString().padLeft(2, '0');
    final dd = day.toString().padLeft(2, '0');
    final yyyy = year.toString();
    return "$mm-$dd-$yyyy";
  }
}
