import 'package:chatbot_app/pages/comment_page/comment_page.dart';
import 'package:chatbot_app/shared/network/remote/dio_helper.dart';
import 'package:chatbot_app/views/screens/my_home_screen.dart';
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
      home: CommentScreen(),
    );
  }
}
