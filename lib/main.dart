import 'package:chatbot_app/pages/post_page/posts_page.dart';
import 'package:chatbot_app/shared/bloc_observes.dart';
import 'package:chatbot_app/shared/themes/light_mode.dart';
import 'package:chatbot_app/pages/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/send_message/message_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThem(),
      themeMode: ThemeMode.light,

      home: PostsScreen(),

      // home: LoginScreen(),

      // home: MessageScreen(),
    );
  }
}

//محمد حسن