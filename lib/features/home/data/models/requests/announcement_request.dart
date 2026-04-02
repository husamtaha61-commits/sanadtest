import 'package:json_annotation/json_annotation.dart';
part 'announcement_request.g.dart';

@JsonSerializable(createFactory: false)
class AnnouncementRequest {
  final bool? isActive;

  AnnouncementRequest({this.isActive});

  Map<String, dynamic> toJson() => _$AnnouncementRequestToJson(this);
}
