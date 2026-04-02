import '../../data/models/responses/slider_response.dart';

class SliderContent {
  final int id;
  final String title;
  final String description;
  final String link;
  final bool isDisabled;
  final String imageUrl;

  SliderContent({
    required this.id,
    required this.title,
    required this.description,
    required this.link,
    required this.isDisabled,
    required this.imageUrl,
  });

  factory SliderContent.fromResponse(SliderResponse response) => SliderContent(
        id: response.id ?? -1,
        title: response.title ?? "",
        description: response.description ?? "",
        link: response.link ?? "",
        isDisabled: response.isDisabled ?? true,
        imageUrl: response.imageUrl ?? "",
      );
}
