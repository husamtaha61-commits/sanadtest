import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/responses/messaging_contact_response.dart';
part 'messaging_contact.freezed.dart';

@Freezed(toJson: false, fromJson: false)
class MessagingContact with _$MessagingContact {
  const factory MessagingContact({
    required int id,
    required String firstName,
    String? middleName,
    required String lastName,
    String? profileImageUrl,
    String? conversationId,
  }) = _MessagingContact;

  factory MessagingContact.fromResponse(MessagingContactResponse? response) {
    if (response == null) {
      return const MessagingContact(
        id: -1,
        firstName: "",
        middleName: "",
        lastName: "",
        profileImageUrl: "",
      );
    }
    return MessagingContact(
      id: response.id ?? -1,
      firstName: response.firstName ?? "",
      middleName: response.middleName,
      lastName: response.lastName ?? "",
      profileImageUrl: response.profileImageUrl,
    );
  }
}
