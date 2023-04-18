import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/services/get_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

abstract class GetPostsController extends GetxController {
  getPosts();
}

class GetPostsControllerImp extends GetPostsController {
  // Map<String, dynamic>? data = null;
  List posts = [];

  @override
  getPosts() async {
    posts = await GetPostsService().getPosts(accessToken: accessToken);
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
