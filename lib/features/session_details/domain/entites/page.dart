import 'package:freezed_annotation/freezed_annotation.dart';
part 'page.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class Page with _$Page {
  const factory Page({
    required int value,
    required bool isChecked,
  }) = _Page;
}
