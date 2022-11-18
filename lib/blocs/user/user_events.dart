import 'package:lobby_chat/models/user_model.dart';

abstract class UserEvent {}

class LoadUserEvent extends UserEvent {}

class LoadOnlineUserEvent extends UserEvent {}

class LoadFavoriteEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  User user;

  AddUserEvent({
    required this.user,
  });
}

class RemoveUserEvent extends UserEvent {
  User user;

  RemoveUserEvent({
    required this.user,
  });
}
