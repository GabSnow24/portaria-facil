import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobby_chat/blocs/message/message_bloc.dart';
import 'package:lobby_chat/blocs/user/user_bloc.dart';
import 'package:lobby_chat/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
        BlocProvider<MessageBloc>(
            create: (BuildContext context) => MessageBloc())
      ],
      child: MaterialApp(
        title: 'Chat - Portaria',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
            primaryColor: Colors.red,
            colorScheme: theme.colorScheme.copyWith(
                secondary: const Color(0xFFFEF9EB), primary: Colors.red)),
        home: const HomeScreen(),
      ),
    );
  }
}
