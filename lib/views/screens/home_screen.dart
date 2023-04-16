import 'package:chat_bot/core/constant/color.dart';
import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/core/helper/api.dart';
import 'package:chat_bot/models/user_model.dart';
import 'package:chat_bot/services/get_posts.dart';
import 'package:chat_bot/views/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../controller/get_posts_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // UserModel? _currentUser;
  // var data = null;
  @override
  Widget build(BuildContext context) {
    GetPostsControllerImp controller = Get.put(GetPostsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Home Screen'),
                onPressed: () async {
                  controller.getPosts();
                  Get.to(PostsScreen());
                },
              ),
              ElevatedButton(
                child: Text('print'),
                onPressed: () async {
                  controller.getPosts();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
