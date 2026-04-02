import 'package:flutter/cupertino.dart';

import '../di/injection.dart';
import '../services/localization_service.dart';

extension AlignmentExtension on Alignment {
  Alignment localized(BuildContext context) => Alignment(getIt<LocalizationService>().isAr(context) ? -x : x, y);
}