import 'package:freezed_annotation/freezed_annotation.dart';

import '../responses/base_field_response.dart';
part 'base_field.g.dart';

@JsonSerializable()
class BaseField {
  final int id;
  final String name;

  BaseField({
    required this.id,
    required this.name,
  });

  factory BaseField.fromResponse(BaseFieldResponse? response) {
    if (response == null) return BaseField(id: -1, name: "");
    return BaseField(id: response.id ?? -1, name: response.name ?? "");
  }

  factory BaseField.fromJson(Map<String, dynamic> json) =>
      _$BaseFieldFromJson(json);

  Map<String, dynamic> toJson() => _$BaseFieldToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseField && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
