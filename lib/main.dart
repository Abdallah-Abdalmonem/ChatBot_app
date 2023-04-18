import 'package:chat_bot/core/constant/app_routes.dart';
import 'package:chat_bot/core/constant/app_theme.dart';
import 'package:chat_bot/views/screens/comment_page.dart';
import 'package:chat_bot/views/screens/home_screen.dart';
import 'package:chat_bot/views/screens/login_screen.dart';
import 'package:chat_bot/views/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeArabic,
      // routes: routes,
      // home: OnBoarding(),
      // home:PostsScreen(),
      
      home: CommentScreen(postId: "113400945051600_114854861572261",),
    );
  }
}
