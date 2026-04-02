import 'package:json_annotation/json_annotation.dart';
part 'slider_request.g.dart';

@JsonSerializable(createFactory: false)
class SliderRequest {
  final bool? isDisabled;

  SliderRequest({this.isDisabled});

  Map<String, dynamic> toJson() => _$SliderRequestToJson(this);
}
