import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pagination_response.freezed.dart';
part 'base_pagination_response.g.dart';

@Freezed(genericArgumentFactories: true, toJson: false)
class BasePaginationResponse<T> with _$BasePaginationResponse<T> {
  const factory BasePaginationResponse({
    @Default([]) List<T> data,
    @Default(0) int totalRecords,
    @Default(0) int totalDisplayRecords,
  }) = _BasePaginationResponse<T>;

  factory BasePaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasePaginationResponseFromJson(json, fromJsonT);
}
