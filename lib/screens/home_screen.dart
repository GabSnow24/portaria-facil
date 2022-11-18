import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/user/user_bloc.dart';
import 'package:lobby_chat/blocs/user/user_events.dart';
import 'package:lobby_chat/models/user_model.dart';
import 'package:lobby_chat/widgets/online_gatekeepers.dart';
import 'package:lobby_chat/widgets/favorite_contacts.dart';
import 'package:lobby_chat/widgets/orders.dart';
import 'package:lobby_chat/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  late final UserBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  Future refreshData() async {
    bloc.add(LoadUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.door_sliding_sharp),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
            const Text(
              'Portaria Fácil',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0XFFFFEFEE),
            labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                  child: Row(
                children: [
                  const Text('Mensagens'),
                  const SizedBox(width: 4),
                  Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      alignment: Alignment.center,
                      child: const Text(
                        '2',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )),
              const Tab(
                text: 'Online',
              ),
              Tab(
                  child: Row(
                children: [
                  const Text('Encomendas'),
                  const SizedBox(width: 4),
                  Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      alignment: Alignment.center,
                      child: const Text(
                        '2',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ))
            ]),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            bloc.add(AddUserEvent(
                user: User(
                    id: 6,
                    name: 'Tiago',
                    imageUrl: 'assets/images/porteiro.jpg',
                    isOnline: true)));
          },
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        FavoriteContacts(
                            onNext: () => _tabController.index = 1),
                        RecentChats(onNext: () => _tabController.index = 1),
                      ],
                    ),
                    OnlineGateKeepers(onNext: () => _tabController.index = 2),
                    Orders(onNext: () => _tabController.index = 3),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
