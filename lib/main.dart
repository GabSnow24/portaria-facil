import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Chat - Portaria',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          primaryColor: Colors.red,
          colorScheme: theme.colorScheme.copyWith(
              secondary: const Color(0xFFFEF9EB), primary: Colors.red)),
      home: HomeScreen(),
    );
  }
}
