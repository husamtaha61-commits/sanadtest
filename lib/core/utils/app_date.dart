import '../extenstions/date_time.dart';
import '../extenstions/string.dart';

abstract class AppDate {
  static const ddMMyyyy = 'dd/MM/yyyy'; // FrontEnd
  static const yyyyMMdd = 'yyyy-MM-dd'; // Backend
  static const MMddyyyy = 'MM/dd/yyyy'; // Facebook
  static const MMMMddyyyy = "MMMM dd, yyyy";

  static const HHmmss = 'HH:mm:ss'; // Backend
  static const HHmm = 'HH:mm'; // FrontEnd
  static const Hmm = 'H:mm'; // FrontEnd
  static const hhmma = 'h:mm a';

  static const sessionEndTimeDuration = Duration(hours: 1);

  // BE/be => Backend
  static String appToBEDate(String date) {
    return date.formatDate(ddMMyyyy, yyyyMMdd);
  }

  static String beToAppDate(String date) {
    return date.formatDate(yyyyMMdd, ddMMyyyy);
  }

  static String getSessionEndTime(DateTime sessionTime, {bool localized = true}) {
    final t = sessionTime
        .add(sessionEndTimeDuration)
        .toStr(hhmma, localized: localized);
    return t;
  }
}
