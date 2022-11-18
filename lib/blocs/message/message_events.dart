import 'package:lobby_chat/models/message_model.dart';

abstract class MessageEvent {}

class LoadMessageEvent extends MessageEvent {}

class LoadRecentMessagesEvent extends MessageEvent {}

class AddMessageEvent extends MessageEvent {
  Message messages;

  AddMessageEvent({
    required this.messages,
  });
}

class RemoveMessageEvent extends MessageEvent {
  Message messages;

  RemoveMessageEvent({
    required this.messages,
  });
}
