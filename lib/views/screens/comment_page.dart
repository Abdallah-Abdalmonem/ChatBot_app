import 'package:chat_bot/views/widgets/comment_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  final postId;
  CommentScreen({super.key, required this.postId});
  var commentController = TextEditingController();
  // var data = null;

  @override
  Widget build(BuildContext context) {
    getCommentController controller =
        Get.put(getCommentController(), permanent: true);

    controller.getComment(postId: postId).then((value) async {});
    return Scaffold(
      body: GetBuilder<getCommentController>(
        init: controller,
        builder: (c) {
          return ConditionalBuilder(
            condition: controller.data.isNotEmpty,
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => commentListItem(
                comment: controller.data['comments']['data'][index]['message'],
                commentId: controller.data['comments']['data'][index]['id'],
                isHidden: controller.data['comments']['data'][index]
                    ['is_hidden'],
                // name:
                //     controller.data['comments']['data'][index]['from']['name'] == null
                //         ? ''
                //         : controller.data['comments']['data'][index]['from']['name'],
                context: context,
              ),
              itemCount: controller.data['comments']['data'].length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
