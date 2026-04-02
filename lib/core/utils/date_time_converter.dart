import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    return json != null ? DateTime.parse(json).toLocal() : null;
  }

  @override
  String? toJson(DateTime? date) {
    return date?.toUtc().toIso8601String();
  }
}
