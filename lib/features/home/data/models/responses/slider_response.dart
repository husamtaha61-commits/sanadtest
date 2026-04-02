import 'package:json_annotation/json_annotation.dart';

part 'slider_response.g.dart';

@JsonSerializable()
class SliderResponse {
  final int? id;
  final String? title;
  final String? description;
  final String? link;
  final bool? isDisabled;
  final String? imageUrl;

  factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);

  SliderResponse({
    this.id,
    this.title,
    this.description,
    this.link,
    this.isDisabled,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => _$SliderResponseToJson(this);
}
