import 'package:skeletonizer/skeletonizer.dart';

import '../../../features/messaging/domain/entities/messaging_contact.dart';
import '../../../features/messaging/domain/entities/messaging_conversation.dart';

final messagingConversationFakeData = MessagingConversation(
    id: "",
    numberOfUnreadMessages: 0,
    lastMessage: "lastMessage",
    lastMessageDateCreation: DateTime.now(),
    otherParticipantInfo: MessagingContact(
      id: 0,
      firstName: BoneMock.name,
      lastName: "",
    ));
