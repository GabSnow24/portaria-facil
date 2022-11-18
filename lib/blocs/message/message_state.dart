import 'package:lobby_chat/models/message_model.dart';

abstract class MessageState {
  List<Message> messages;

  MessageState({required this.messages});
}

class MessageInitialState extends MessageState {
  MessageInitialState() : super(messages: []);
}

class MessageSucessState extends MessageState {
  MessageSucessState({required List<Message> messages})
      : super(messages: messages);
}
