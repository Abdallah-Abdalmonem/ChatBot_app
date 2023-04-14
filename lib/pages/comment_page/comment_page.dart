import 'package:chatbot_app/shared/network/local/componant/comment_item.dart';
import 'package:chatbot_app/shared/network/local/componant/list_item.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_comment/comment_cubit.dart';
import 'bloc_comment/comment_state.dart';

class CommentScreen extends StatelessWidget {
  final postId;
  CommentScreen({super.key, required  this.postId});
  var commentController = TextEditingController();
  var data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CommentCubit();
      },
      child: BlocConsumer<CommentCubit, CommentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = CommentCubit.get(context);

          bloc.getComments(postId: postId).then((value) async {
            data = await value;
          });
          print('mo!!!!!!!??????????????');


          return Scaffold(
            body: ConditionalBuilder(
              condition: data != null,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) => commentListItem(
                  comment: data['comments']['data'][index]['message'],
                  commentId:data['comments']['data'][index]['id'], 
                  isShow:data['comments']['data'][index]['is_hidden'], 
                  name:data['comments']['data'][index]['from']['name'], 
                  context: context,
                ),
                itemCount: data['comments']['data'].length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
