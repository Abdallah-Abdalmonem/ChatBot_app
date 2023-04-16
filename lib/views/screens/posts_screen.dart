import 'package:chat_bot/controller/get_posts_controller.dart';
import 'package:chat_bot/core/constant/color.dart';
import 'package:chat_bot/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetPostsControllerImp controller = Get.find();
    print('before scaffold');
    return Scaffold(
      backgroundColor: AppColor.buttonblue,
      body: SafeArea(
        child: GetBuilder<GetPostsControllerImp>(builder: (a) {
          return ListView.builder(
            itemCount: a.posts!.length,
            itemBuilder: (context, index) {
              return itemPost(
                  // title: '${a.data!['posts']['data'][index]['message']}',
                  title: '${a.posts![index]['message']}',
                  date: '${a.posts![index]['created_time']}',
                  onPress: () {
                    print('object $index');
                  });
            },
          );
        }),
      ),
    );
  }
}
