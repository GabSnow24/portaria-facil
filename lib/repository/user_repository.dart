import 'package:lobby_chat/models/user_model.dart';

class UserRepository {
  final List<User> _users = [];

  List<User> loadUsers() {
    _users.addAll([
      User(id: 1, name: 'Adry', imageUrl: 'assets/images/porteiro.jpg'),
      User(id: 2, name: 'Joseph', imageUrl: 'assets/images/porteiro.jpg'),
      User(id: 3, name: 'Dorinho', imageUrl: 'assets/images/porteiro.jpg')
    ]);
    return _users;
  }

  User addUser(User user) {
    _users.add(user);
    return user;
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
