import 'package:lobby_chat/models/user_model.dart';

abstract class UserState {
  List<User> users;

  UserState({required this.users});
}

class UserInitialState extends UserState {
  UserInitialState() : super(users: []);
}

class UserSucessState extends UserState {
  UserSucessState({required List<User> users}) : super(users: users);
}
