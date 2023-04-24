import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/core/helper/api.dart';
import 'package:chat_bot/models/collection_post_model.dart';
import 'package:chat_bot/models/posts_model.dart';
import 'package:chat_bot/services/get_posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

abstract class GetPostsController extends GetxController {
  getPosts();
}

class GetPostsControllerImp extends GetPostsController {
  var posts = [];
  @override
  getPosts() async {
    posts = await Api().getPosts(accessToken: accessToken1);
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
