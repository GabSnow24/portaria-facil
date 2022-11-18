import 'package:lobby_chat/models/message_model.dart';
import 'package:lobby_chat/models/user_model.dart';

class UserRepository {
  final List<User> _users = [];

  List<User> loadUsers() {
    if (_users.isEmpty) {
      _users.addAll([
        User(
            id: 1,
            name: 'Adry',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true),
        User(
            id: 2,
            name: 'Joseph',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true),
        User(
            id: 3,
            name: 'Dorinho',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true)
      ]);
      return _users;
    }
    return _users;
  }

  List<User> loadOnlineUsers() {
    if (_users.isEmpty) {
      _users.addAll([
        User(
            id: 1,
            name: 'Adry',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true),
        User(
            id: 2,
            name: 'Joseph',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true),
        User(
            id: 3,
            name: 'Dorinho',
            imageUrl: 'assets/images/porteiro.jpg',
            isOnline: true)
      ]);
      return _users;
    }
    return _users;
  }

  List<User> loadFavorite() {
    _users.addAll(favorites);
    return _users;
  }

  List<User> addUser(User user) {
    _users.add(user);
    return _users;
  }

  User findOneUser(int id) {
    return _users.firstWhere((user) => user.id == id);
  }

  List<User> removeUser(int id) {
    final User foundedUser = _users.firstWhere((user) => user.id == id);
    _users.remove(foundedUser);
    return _users;
  }
}
