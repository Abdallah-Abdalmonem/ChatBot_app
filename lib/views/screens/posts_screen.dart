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
<<<<<<< HEAD
    GetPostsControllerImp controller = Get.find();
=======
    GetPostsControllerImp controller = Get.put(GetPostsControllerImp());
>>>>>>> 7282d09c2100bdef7a479a6173807da63bad718a
    return Scaffold(
      backgroundColor: AppColor.body,
      appBar: AppBar(
        elevation: 0,
        title: Text("Posts"),
        backgroundColor: AppColor.appbar,
        actions: [
          IconButton(
              onPressed: () {
                controller.getPosts();
              },
              icon: const Icon(Icons.show_chart))
        ],
      ),
      body: GetBuilder<GetPostsControllerImp>(builder: (a) {
        return ListView.builder(
          itemCount: a.posts.length,
          itemBuilder: (context, index) {
            return itemPost(
                // title: '${a.data!['posts']['data'][index]['message']}',
                title: '${a.posts[index]['message']}',
                date: '${a.posts[index]['createdTime']}',
                onPress: () {
                  print('object $index');
                });
          },
        );
      }),
    );
  }
}
