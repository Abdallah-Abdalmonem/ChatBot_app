import 'package:chat_bot/views/widgets/comment_item.dart';
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
    // Get.putAsync<getCommentController>(
    //     () async => await getCommentController());
    Get.lazyPut(() => getCommentController());
    getCommentController controller = Get.find().getComment(postId: postId);
    var data = controller.getComment(postId: postId);
    return Scaffold(
      body: GetBuilder<getCommentController>(
        builder: (c) {
          return ListView.separated(
            itemBuilder: (context, index) => commentListItem(
              comment: data['comments']['data'][index]['message'],
              commentId: data['comments']['data'][index]['id'],
              isHidden: data['comments']['data'][index]['is_hidden'],
              // name:
              //     data['comments']['data'][index]['from']['name'] == null
              //         ? ''
              //         : data['comments']['data'][index]['from']['name'],
              context: context,
            ),
            itemCount: data['comments']['data'].length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
    );
  }
}
// ConditionalBuilder(
          
        //   condition: data != null && data['comments']['data'] != null,
        //   builder: (context) => ListView.separated(
        //     itemBuilder: (context, index) => commentListItem(
        //       comment: data['comments']['data'][index]['message'],
        //       commentId: data['comments']['data'][index]['id'],
        //       isHidden: data['comments']['data'][index]['is_hidden'],
        //       // name:
        //       //     data['comments']['data'][index]['from']['name'] == null
        //       //         ? ''
        //       //         : data['comments']['data'][index]['from']['name'],
        //       context: context,
        //     ),
        //     itemCount: data['comments']['data'].length,
        //     separatorBuilder: (BuildContext context, int index) {
        //       return const SizedBox(
        //         height: 10,
        //       );
        //     },
        //   ),
        //   fallback: (context) => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // );
        // 