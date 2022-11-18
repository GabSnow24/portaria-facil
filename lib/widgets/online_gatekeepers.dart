import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/user/user_bloc.dart';
import 'package:lobby_chat/blocs/user/user_events.dart';
import 'package:lobby_chat/blocs/user/user_state.dart';
import 'package:lobby_chat/models/user_model.dart';
import 'package:lobby_chat/screens/chat_screen.dart';

class OnlineGateKeepers extends StatefulWidget {
  const OnlineGateKeepers({super.key, required int Function() onNext});

  @override
  State<OnlineGateKeepers> createState() => _OnlineGateKeepersState();
}

class _OnlineGateKeepersState extends State<OnlineGateKeepers> {
  late final bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UserBloc>(context);
    bloc.add(LoadOnlineUserEvent());
  }

  Future refreshData() async {
    bloc.add(LoadOnlineUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: BlocBuilder<UserBloc, UserState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is UserInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserSucessState) {
                  final List<User> onlineUsers = state.users;
                  return ListView.builder(
                    itemCount: onlineUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final User user = onlineUsers[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatScreen(user: user))),
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, right: 20.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 35.0,
                                    backgroundImage: AssetImage(user.imageUrl),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  const SizedBox(height: 5.0),
                                  user.isOnline
                                      ? Container(
                                          width: 60.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'ONLINE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      : Container(
                                          width: 60.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'OFFLINE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
