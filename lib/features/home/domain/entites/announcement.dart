import '../../data/models/responses/announcement_response.dart';

class Announcement {
  final int id;
  final String title;
  final String body;
  final String link;
  final bool isActive;
  final String imageUrl;
  final String startVisibilityDate;
  final String expirationDate;

  Announcement(
      {required this.id,
      required this.title,
      required this.body,
      required this.link,
      required this.isActive,
      required this.imageUrl,
      required this.startVisibilityDate,
      required this.expirationDate});

  factory Announcement.fromResponse(AnnouncementResponse response) =>
      Announcement(
        id: response.id ?? -1,
        title: response.title ?? "",
        body: response.body ?? "",
        link: response.link ?? "",
        isActive: response.isActive ?? false,
        imageUrl: response.imageUrl ?? "",
        startVisibilityDate: response.startVisibilityDate ?? "",
        expirationDate: response.expirationDate ?? "",
      );
}
