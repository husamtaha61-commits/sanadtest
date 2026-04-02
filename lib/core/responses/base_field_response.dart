import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_field_response.freezed.dart';
part 'base_field_response.g.dart';

@Freezed()
class BaseFieldResponse with _$BaseFieldResponse {
  const factory BaseFieldResponse({ int? id, String? name}) =
      _BaseFieldResponse;

  factory BaseFieldResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseFieldResponseFromJson(json);
}
