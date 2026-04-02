import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../gen/translations/locale_keys.g.dart';
import '../services/app_preferences.dart';

@lazySingleton
class TimeAgoCustomMessages implements timeago.LookupMessages {
  final AppPreferences _appPreferences;

  TimeAgoCustomMessages(this._appPreferences);

  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => LocaleKeys.timeAgo_justNow.tr();
  @override
  String aboutAMinute(int minutes) => LocaleKeys.timeAgo_aboutAMinute.tr();

  @override
  String minutes(int minutes) => LocaleKeys.timeAgo_value.tr(args: [
        _getPrefix(minutes),
        _appPreferences.isAr
            ? _getCorrectForm(minutes, 'دقيقة', 'دقيقتان', 'دقائق')
            : "mins ago"
      ]);
  @override
  String aboutAnHour(int minutes) => LocaleKeys.timeAgo_aboutAnHour.tr();
  @override
  String hours(int hours) => LocaleKeys.timeAgo_value.tr(args: [
        _getPrefix(hours),
        _appPreferences.isAr
            ? _getCorrectForm(hours, 'ساعة', 'ساعتان', 'ساعات')
            : "hours ago"
      ]);
  @override
  String aDay(int hours) => LocaleKeys.timeAgo_aDay.tr();
  @override
  String days(int days) => LocaleKeys.timeAgo_value.tr(args: [
        _getPrefix(days),
        _appPreferences.isAr
            ? _getCorrectForm(days, 'يوم', 'يومان', 'أيام')
            : "days ago"
      ]);

  @override
  String aboutAMonth(int days) => LocaleKeys.timeAgo_aboutAMonth.tr();
  @override
  String months(int months) => LocaleKeys.timeAgo_value.tr(args: [
        _getPrefix(months),
        _appPreferences.isAr
            ? _getCorrectForm(months, 'شهر', 'شهران', 'أشهر')
            : "months ago"
      ]);
  @override
  String aboutAYear(int year) => LocaleKeys.timeAgo_aboutAYear.tr();
  @override
  String years(int years) => LocaleKeys.timeAgo_value.tr(args: [
        _getPrefix(years),
        _appPreferences.isAr
            ? _getCorrectForm(years, 'سنة', 'سنتان', 'سنوات')
            : "years ago"
      ]);
  @override
  String wordSeparator() => ' ';

  String _getCorrectForm(
      int count, String singular, String dual, String plural) {
    if (count == 1) {
      return singular;
    } else if (count == 2) {
      return dual;
    } else if (count >= 3 && count <= 10) {
      return plural;
    } else {
      return singular;
    }
  }

  String _getPrefix(int time) {
    return _appPreferences.isAr
        ? "${LocaleKeys.timeAgo_ago.tr()} ${time.toString()}"
        : time.toString();
  }
}
