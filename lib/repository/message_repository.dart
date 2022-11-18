import 'package:lobby_chat/models/message_model.dart';

class MessageRepository {
  final List<Message> _messages = [];

  List<Message> loadMessages() {
    _messages.addAll([
      Message(
        id: 3,
        sender: adryUser,
        time: '5:30 AM',
        text: 'Oiii, chegou encomenda!',
        unread: true,
      ),
      Message(
        id: 2,
        sender: currentUser,
        time: '4:30 PM',
        text:
            'Just walked my doge. She was super duper cute. The best pupper!!',
        unread: true,
      ),
      Message(
        id: 1,
        sender: adryUser,
        time: '3:45 PM',
        text: 'How\'s the doggo?',
        unread: true,
      )
    ]);
    return _messages;
  }

  List<Message> loadRecentMessages() {
    _messages.addAll([
      Message(
          id: 1,
          sender: adryUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: false),
      Message(
          id: 1,
          sender: queirozUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: dorinhoUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: fpUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: gilmarUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: tiagoUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: tiagoUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
      Message(
          id: 1,
          sender: tiagoUser,
          time: '5:30 AM',
          text: 'Oiii, chegou encomenda!',
          unread: true),
    ]);
    return _messages;
  }

  List<Message> addMessage(Message message) {
    _messages.insert(0, message);
    return _messages;
  }

  Message findOneMessage(int id) {
    return _messages.firstWhere((msg) => msg.id == id);
  }

  List<Message> removeMessage(int id) {
    final Message foundedMessage = _messages.firstWhere((msg) => msg.id == id);
    _messages.remove(foundedMessage);
    return _messages;
  }
}
