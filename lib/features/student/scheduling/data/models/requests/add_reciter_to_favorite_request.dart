import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_reciter_to_favorite_request.g.dart';

@JsonSerializable(createFactory: false)
class AddReciterToFavoriteRequest {
  final int reciterId;

  AddReciterToFavoriteRequest({required this.reciterId});

  Map<String, dynamic> toJson() => _$AddReciterToFavoriteRequestToJson(this);
}
