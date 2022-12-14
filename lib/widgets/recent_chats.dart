import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/message/message_bloc.dart';
import 'package:lobby_chat/blocs/message/message_events.dart';
import 'package:lobby_chat/blocs/message/message_state.dart';
import 'package:lobby_chat/screens/chat_screen.dart';

import '../models/message_model.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({super.key, required int Function() onNext});

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  late final bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<MessageBloc>(context);
    bloc.add(LoadRecentMessagesEvent());
  }

  Future refreshData() async {
    bloc.add(LoadMessageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: BlocBuilder<MessageBloc, MessageState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is MessageInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MessageSucessState) {
                  final List<Message> recentChats = state.messages;
                  return ListView.builder(
                    itemCount: recentChats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message chat = recentChats[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatScreen(user: chat.sender))),
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, right: 20.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: chat.unread
                                  ? const Color(0XFFFFEFEE)
                                  : Colors.white,
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
                                    backgroundImage:
                                        AssetImage(chat.sender.imageUrl),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        chat.sender.name,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Text(
                                          chat.text,
                                          style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    chat.time,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  chat.unread
                                      ? Container(
                                          width: 50.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'NOVA',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      : const Text('')
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
