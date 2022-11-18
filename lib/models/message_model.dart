import 'package:lobby_chat/models/user_model.dart';

class Message {
  final int id;
  final User sender;
  final String time;
  final String text;
  final bool unread;
  Message(
      {required this.sender,
      required this.time,
      required this.text,
      required this.unread,
      required this.id});
}

final User currentUser = User(
    id: 0,
    name: 'Gabriel',
    imageUrl: 'assets/images/porteiro.jpg/',
    isOnline: true);

final User adryUser = User(
    id: 1,
    name: 'Adry',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

final User queirozUser = User(
    id: 2,
    name: 'Joseph',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

final User dorinhoUser = User(
    id: 3,
    name: 'Dorinho',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

final User fpUser = User(
    id: 4,
    name: 'Fillipinho',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

final User gilmarUser = User(
    id: 5,
    name: 'Gilmar',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

final User tiagoUser = User(
    id: 6,
    name: 'Tiago',
    imageUrl: 'assets/images/porteiro.jpg',
    isOnline: true);

List<User> favorites = [
  adryUser,
  queirozUser,
  dorinhoUser,
  fpUser,
  gilmarUser,
  tiagoUser
];

List<Message> chats = [
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
];

List<Message> messages = [
  Message(
    id: 1,
    sender: adryUser,
    time: '5:30 AM',
    text: 'Oiii, chegou encomenda!',
    unread: true,
  ),
  Message(
    id: 1,
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '3:15 PM',
    text: 'All the food',
    unread: true,
  ),
  Message(
    id: 1,
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
  Message(
    id: 1,
    sender: adryUser,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
];
