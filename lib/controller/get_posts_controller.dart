import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/models/posts_model.dart';
import 'package:chat_bot/services/get_posts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

abstract class GetPostsController extends GetxController {
  getPosts();
}

class GetPostsControllerImp extends GetPostsController {
  GetPostsService getPostsService = GetPostsService();

  List<Data> posts = [];
  RxInt itemCount = 0.obs;

  @override
  getPosts() async {
    posts = await getPostsService.getPosts(accessToken: accessToken1);
    itemCount.value = posts.length;
    // update();
  }

  @override
  void onInit() async {
    // posts = await getPostsService.getPosts(accessToken: accessToken1);
    // itemCount.value = posts.length;

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
