import 'package:chatbot_app/shared/constant/image_assets.dart';
import 'package:chatbot_app/shared/network/local/componant/button.dart';
import 'package:chatbot_app/shared/network/local/componant/textfromfield.dart';

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
      create: (context) => CommentCubit(),
      child: BlocConsumer<CommentCubit, CommentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = CommentCubit.get(context);
          return Scaffold(
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                  width: double.infinity,
                ),
                Container(
                    height: 180,
                    width: 180,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        AppImageAsset.appIcon,
                      ),
                    )),
                const SizedBox(
                  height: 13,
                  width: double.infinity,
                ),
                Container(
                  height: 60,
                  width: 240,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'التعليق التلقائي',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 250,
                  child: defaultTextFormField(
                    labelText: 'تعليق',
                    textController: commentController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                defaultButton(
                  onPressed: () {
                    bloc.getPostsAndcomment();
                    
                  },
                  text: 'ارسال',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
