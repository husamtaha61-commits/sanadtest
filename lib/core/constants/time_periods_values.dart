import '../../gen/assets.gen.dart';
import '../../gen/translations/locale_keys.g.dart';
import '../entities/time_periods.dart';

final timePeriodsValues = [
  TimePeriods(
    id: 1,
    name: LocaleKeys.timePeriods_daytime,
    periods: [
      Period(
        id: 1,
        range: "9-12",
        imagePath: Assets.icons.t9T12.path,
      ),
      Period(
        id: 2,
        range: "12-15",
        imagePath: Assets.icons.t12T15.path,
      ),
      Period(
        id: 3,
        range: "15-18",
        imagePath: Assets.icons.t15T18.path,
      ),
    ],
  ),
  TimePeriods(
    id: 2,
    name: LocaleKeys.timePeriods_eveningAndNight,
    periods: [
      Period(
        id: 4,
        range: "18-21",
        imagePath: Assets.icons.t18T21.path,
      ),
      Period(
        id: 5,
        range: "21-0",
        imagePath: Assets.icons.t21T0.path,
      ),
      Period(
        id: 6,
        range: "0-3",
        imagePath: Assets.icons.t0T3.path,
      ),
    ],
  ),
  TimePeriods(
    id: 3,
    name: LocaleKeys.timePeriods_morning,
    periods: [
      Period(
        id: 7,
        range: "3-6",
        imagePath: Assets.icons.t3T6.path,
      ),
      Period(
        id: 8,
        range: "6-9",
        imagePath: Assets.icons.t6T9.path,
      ),
    ],
  )
];
