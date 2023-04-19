import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/models/posts_model.dart';
import 'package:chat_bot/services/get_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

abstract class GetPostsController extends GetxController {
  getPosts();
}

class GetPostsControllerImp extends GetPostsController {
  Map<String, dynamic>? data = null;
  List<dynamic> posts = [];

  @override
  getPosts() async {
<<<<<<< HEAD
    posts = await GetPostsService().getPosts(accessToken: accessToken);
=======
    posts = await GetPostsService().getPosts(accessToken: accessToken1);
>>>>>>> 7282d09c2100bdef7a479a6173807da63bad718a
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
