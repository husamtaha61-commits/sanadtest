import 'package:json_annotation/json_annotation.dart';

part 'announcement_response.g.dart';

@JsonSerializable()
class AnnouncementResponse {
  final int? id;
  final String? title;
  final String? body;
  final String? link;
  final bool? isActive;
  final String? imageUrl;
  final String? startVisibilityDate;
  final String? expirationDate;

  AnnouncementResponse(
      {required this.id,
      required this.title,
      required this.body,
      required this.link,
      required this.isActive,
      required this.imageUrl,
      required this.startVisibilityDate,
      required this.expirationDate});

  factory AnnouncementResponse.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementResponseToJson(this);
}
