import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/message/message_bloc.dart';
import 'package:lobby_chat/blocs/message/message_events.dart';
import 'package:lobby_chat/blocs/message/message_state.dart';
import 'package:lobby_chat/screens/chat_screen.dart';

import '../models/message_model.dart';

class Orders extends StatefulWidget {
  const Orders({super.key, required int Function() onNext});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
    showModal() {}

    return SizedBox(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              child: Center(
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                width: MediaQuery.of(context).size.height / 2.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 25.0,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "Porta Copos",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: const SizedBox(
                                            child: Image(
                                                height: 200,
                                                width: 300,
                                                image: AssetImage(
                                                    'assets/images/pacote.jpg'),
                                                fit: BoxFit.fill)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: const Text(
                                            "Recebido ontem",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Container(
                                          child: const Divider(
                                              color: Colors.black54),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: const Text(
                                            "Código de Rastreio",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: const Text(
                                            "ABCDEFGRWQWEQ12312",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}

// return SizedBox(
//       child: Container(
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0))),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
//           child: BlocBuilder<MessageBloc, MessageState>(
//               bloc: bloc,
//               builder: (context, state) {
//                 if (state is MessageInitialState) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is MessageSucessState) {
//                   final List<Message> recentChats = state.messages;
//                   return ListView.builder(
//                     itemCount: recentChats.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final Message chat = recentChats[index];
//                       return GestureDetector(
//                         onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => ChatScreen(user: chat.sender))),
//                         child: Container(
//                           margin: const EdgeInsets.only(
//                             top: 5.0,
//                             bottom: 5.0,
//                             right: 8.0,
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 6.0, vertical: 6.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: const BorderRadius.only(
//                                   topRight: Radius.circular(20.0),
//                                   bottomLeft: Radius.circular(20.0)),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.8),
//                                   spreadRadius: 2,
//                                   blurRadius: 2,
//                                   offset: const Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ]),
//                           child: Row(
//                             children: [
//                               Row(
//                                 children: <Widget>[
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     child: SizedBox(
//                                         height: 80.0,
//                                         width: 80.0,
//                                         child: Image(
//                                           image:
//                                               AssetImage(chat.sender.imageUrl),
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(left: 30.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     const Text(
//                                       'Porta Sacos', //TODO INSERIR REPOSITORIO DE PACOTES
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Text(
//                                       'ABCDERFE1231',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 15.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 60.0),
//                                     chat.unread
//                                         ? Container(
//                                             width: 80.0,
//                                             height: 20.0,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.greenAccent[700],
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         30.0)),
//                                             alignment: Alignment.center,
//                                             child: const Text(
//                                               'RECEBIDO',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 12.0,
//                                                   fontWeight: FontWeight.bold),
//                                             ))
//                                         : Container(
//                                             width: 80.0,
//                                             height: 20.0,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.grey,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         30.0)),
//                                             alignment: Alignment.center,
//                                             child: const Text(
//                                               'DEVOLVIDO',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 12.0,
//                                                   fontWeight: FontWeight.bold),
//                                             ))
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//                 return Container();
//               }),
//         ),
//       ),
//     );

// return SizedBox(
//       child: Column(
//         children: [
//           Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Card(
//                 clipBehavior: Clip.antiAlias,
//                 elevation: 16,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 child: InkWell(
//                   onTap: () {},
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         alignment: Alignment.bottomLeft,
//                         children: [
//                           Ink.image(
//                             height: 200,
//                             image: const AssetImage('assets/images/pacote.jpg'),
//                             fit: BoxFit.fitWidth,
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 16, top: 16, right: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const <Widget>[
//                             Text(
//                               'Porta Copos',
//                               style: TextStyle(color: Colors.black54),
//                             ),
//                             Text(
//                               '1231231ABCDEDEF',
//                             ),
//                             Text(
//                               'Recebido em 23/04/2022',
//                             )
//                           ],
//                         ),
//                       ),
//                       const ButtonBar()
//                     ],
//                   ),
//                 ),
//               )),
//           Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Card(
//                 clipBehavior: Clip.antiAlias,
//                 elevation: 16,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 child: InkWell(
//                   onTap: () {},
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         alignment: Alignment.bottomLeft,
//                         children: [
//                           Ink.image(
//                             height: 200,
//                             image: const AssetImage('assets/images/pacote.jpg'),
//                             fit: BoxFit.fitWidth,
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 16, top: 16, right: 16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const <Widget>[
//                             Text(
//                               'Porta Copos',
//                               style: TextStyle(color: Colors.black54),
//                             ),
//                             Text(
//                               '1231231ABCDEDEF',
//                             ),
//                             Text(
//                               'Recebido em 23/04/2022',
//                             )
//                           ],
//                         ),
//                       ),
//                       const ButtonBar()
//                     ],
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
