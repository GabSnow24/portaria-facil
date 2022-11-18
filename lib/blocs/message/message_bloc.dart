import 'package:bloc/bloc.dart';
import 'package:lobby_chat/blocs/message/message_events.dart';
import 'package:lobby_chat/blocs/message/message_state.dart';
import 'package:lobby_chat/repository/message_repository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final _messageRepo = MessageRepository();

  MessageBloc() : super(MessageInitialState()) {
    on<LoadMessageEvent>((event, emit) =>
        emit(MessageSucessState(messages: _messageRepo.loadMessages())));
    on<LoadRecentMessagesEvent>((event, emit) =>
        emit(MessageSucessState(messages: _messageRepo.loadRecentMessages())));
    on<AddMessageEvent>((event, emit) => emit(
        MessageSucessState(messages: _messageRepo.addMessage(event.messages))));
  }
}
