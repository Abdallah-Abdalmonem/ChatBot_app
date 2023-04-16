import 'package:chat_bot/views/screens/home_screen.dart';
import 'package:chat_bot/views/screens/login_screen.dart';
import 'package:chat_bot/views/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String posts = '/posts';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => LoginScreen(),
  AppRoutes.home: (context) => HomeScreen(),
  AppRoutes.posts: (context) => PostsScreen(),
};
