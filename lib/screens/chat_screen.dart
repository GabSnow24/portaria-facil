import 'package:flutter/material.dart';
import 'package:lobby_chat/models/user_model.dart';
import 'package:lobby_chat/widgets/chat_message.dart';
import '../models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final ChatMessage msg = ChatMessage(message: message, isMe: isMe);
    if (isMe) {
      return Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 40.0),
            width: MediaQuery.of(context).size.width * 0.12,
            child: IconButton(
              icon: message.unread
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.check),
              iconSize: 20.0,
              color: Colors.blueGrey,
              onPressed: () {},
            ),
          ),
          msg,
        ],
      );
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  _buildMessageCompose() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.photo),
          color: Theme.of(context).colorScheme.primary,
        ),
        const Expanded(
            child: TextField(
          autocorrect: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration.collapsed(hintText: 'Mensagem'),
        )),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
          color: Theme.of(context).colorScheme.primary,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          widget.user.name,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (() => FocusScope.of(context).unfocus()),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    child: ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message message = messages[index];
                          final bool isMe = message.sender.id == currentUser.id;
                          return _buildMessage(message, isMe);
                        }),
                  )),
            ),
            _buildMessageCompose(),
          ],
        ),
      ),
    );
  }
}
