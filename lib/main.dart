
import 'package:chatbot_app/pages/post_page/posts_page.dart';
import 'package:chatbot_app/shared/network/remote/dio_helper.dart';


import 'package:chatbot_app/views/screens/login_screen.dart';

import 'package:flutter/material.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: PostsScreen(),

      // home: LoginScreen(),

    );
  }
}

//محمد حسن