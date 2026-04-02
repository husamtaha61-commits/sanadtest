import 'package:json_annotation/json_annotation.dart';

part 'wordpress_response.g.dart';

@JsonSerializable()
class WordPressResponse {
  final String url;

  WordPressResponse({required this.url});

  factory WordPressResponse.fromJson(Map<String, dynamic> json) =>
      _$WordPressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WordPressResponseToJson(this);
}
