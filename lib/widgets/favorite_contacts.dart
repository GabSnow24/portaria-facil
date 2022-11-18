import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/user/user_bloc.dart';
import 'package:lobby_chat/blocs/user/user_events.dart';
import 'package:lobby_chat/blocs/user/user_state.dart';
import 'package:lobby_chat/models/user_model.dart';
import 'package:lobby_chat/screens/chat_screen.dart';

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({super.key, required int Function() onNext});

  @override
  _FavoriteContactsState createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  late final bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UserBloc>(context);
    bloc.add(LoadUserEvent());
  }

  Future refreshData() async {
    bloc.add(LoadUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Porteiros Favoritos',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 30.0,
                      color: Colors.blueGrey,
                    )
                  ],
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is UserInitialState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is UserSucessState) {
                      List<User> favorites = state.users;

                      return SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 10.0),
                            itemCount: favorites.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ChatScreen(
                                            user: favorites[index]))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 35.0,
                                        backgroundImage: AssetImage(
                                            favorites[index].imageUrl),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        favorites[index].name,
                                        style: const TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ));
  }
}
