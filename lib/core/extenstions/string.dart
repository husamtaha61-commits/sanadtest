import 'package:easy_localization/easy_localization.dart';

import '../utils/app_date.dart';
import 'date_time.dart';

extension StringExtensions on String {
  String toCapitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
    return '';
  }

  DateTime? toDate(String dateFormat) {
    try {
      return DateFormat(dateFormat).parse(this);
    }
    catch (e) {
      return null;
    }
  }

  String toHHMMAFormat(String oldFormat, {bool localized = false}) {
    final date = toDate(oldFormat);
    return date?.toStr(AppDate.hhmma, localized: localized) ?? "NA";
  }

  String formatDate(String oldFormat, String newFormat, {bool localized = false}) {
    final date = toDate(oldFormat);
    return date?.toStr(newFormat, localized: localized) ?? "NA";
  }
}

extension NullableStringExtensions on String? {
  bool get isNotNullOrEmpty => this != null ? this!.isNotEmpty : false;
}

extension StringTextTypesExtractor on String {
  List<_TextTypes> extractTypes() {
    final linkRegExp = RegExp(
        r"((https?:www\.)|(https?://)|(www\.))[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(/[-a-zA-Z0-9()@:%_+.~#?&/=]*)?",
        caseSensitive: false
    );

    List<_TextTypes> parts = [];
    int lastIndex = 0;

    for (Match match in linkRegExp.allMatches(this)) {
      // Add the text before the link (if any)
      if (match.start > lastIndex) {
        parts.add(Plain(substring(lastIndex, match.start)));
      }
      // Add the matched link
      parts.add(Link(match.group(0)!));
      lastIndex = match.end;
    }

    // Add any remaining text after the last link
    if (lastIndex < length) {
      parts.add(Plain(substring(lastIndex)));
    }

    return parts;
  }
}

sealed class _TextTypes {
  const _TextTypes(this.value);
  final String value;
}
class Plain extends _TextTypes {
  Plain(super.value);
}
class Link extends _TextTypes {
  Link(super.value);
}
