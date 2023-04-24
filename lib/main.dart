import 'package:chat_bot/core/constant/app_routes.dart';
import 'package:chat_bot/core/constant/app_theme.dart';
import 'package:chat_bot/views/screens/create_post_screen.dart';
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
      locale: Locale('ar'),
      routes: routes,
      home: CreatePostScreen(),
    );
  }
}
