import 'package:chat_bot/controller/get_posts_controller.dart';
import 'package:chat_bot/core/constant/color.dart';
import 'package:chat_bot/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/posts_test_controller.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetPostsControllerImp controller = Get.put(GetPostsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.body,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Posts"),
        backgroundColor: AppColor.appbar,
        actions: [
          IconButton(
              onPressed: () async {
                await controller.getPosts();
              },
              icon: const Icon(Icons.show_chart))
        ],
      ),
      body: Obx(() {
        if (controller.itemCount.value <= 0) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.itemCount.value,
            itemBuilder: (context, index) {
              return itemPost(
                  title: '${controller.posts[index].message}',
                  date: '${controller.posts[index].createdTime}',
                  onPress: () {
                    print('item $index');
                  });
            },
          );
        }
      }),
    );
  }
}
