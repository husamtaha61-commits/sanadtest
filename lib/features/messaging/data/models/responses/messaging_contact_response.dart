import 'package:json_annotation/json_annotation.dart';
part 'messaging_contact_response.g.dart';

@JsonSerializable()
class MessagingContactResponse {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImageUrl;

  MessagingContactResponse({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImageUrl,
  });

  factory MessagingContactResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagingContactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessagingContactResponseToJson(this);
}
