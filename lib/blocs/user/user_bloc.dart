import 'package:bloc/bloc.dart';
import 'package:lobby_chat/blocs/user/user_events.dart';
import 'package:lobby_chat/blocs/user/user_state.dart';
import 'package:lobby_chat/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepo = UserRepository();

  UserBloc() : super(UserInitialState()) {
    on<LoadUserEvent>(
        (event, emit) => emit(UserSucessState(users: _userRepo.loadUsers())));
    on<LoadOnlineUserEvent>((event, emit) =>
        emit(UserSucessState(users: _userRepo.loadOnlineUsers())));
    on<AddUserEvent>((event, emit) =>
        emit(UserSucessState(users: _userRepo.addUser(event.user))));
  }
}
