import 'package:chatbot_app/shared/constant/image_assets.dart';
import 'package:chatbot_app/shared/network/local/componant/button.dart';
import 'package:chatbot_app/shared/network/local/componant/list_item.dart';
import 'package:chatbot_app/shared/network/local/componant/textfromfield.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_comment/comment_cubit.dart';
import 'bloc_comment/comment_state.dart';
import 'package:http/http.dart' as http;

class CommentScreen extends StatelessWidget {
  var commentController = TextEditingController();

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
          var data;

          bloc.getPosts().then((value) async {
            print('mo !!!!!!!!!!!!!!!!!!!');
            data = await value;
            print(data);
          });
          return Scaffold(
            body: ConditionalBuilder(
              condition: data == null,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) => listItem(
                  image: data['posts']['data'][index]['full_picture'],
                  date: data['posts']['data'][index]['created_time'],
                  title: data['posts']['data'][index]['message'],
                ),
                itemCount: data['posts']['data'].length,
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
