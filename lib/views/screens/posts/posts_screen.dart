import 'package:chatbot_app/data/models/user_model.dart';
import 'package:chatbot_app/pages/post_page/bloc_post/posts_cubit.dart';
import 'package:chatbot_app/shared/constant/color.dart';
import 'package:chatbot_app/views/screens/posts/cubit/posts_cubit.dart';
import 'package:chatbot_app/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});
  var commentController = TextEditingController();
  Map<String, dynamic>? data = null;

  @override
  Widget build(BuildContext context) {
    print('before scaffold');
    return Scaffold(
      backgroundColor: AppColor.buttonblue,
      body: SafeArea(
        child: BlocConsumer<PostsCubit, PostsState>(
            listener: (context, state) async {
          if (state is SuccessGetPostsState) {
            data = await state.posts;
          }
        }, builder: (context, state) {
          print('oooooooooooooooooooooooooooooooooooooooooo');

          // if (data == null) {
          //  data = BlocProvider.of<PostsCubit>(context).getPost();

          // }

          // if (state is SuccessGetPostsState) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return itemPost(
                  title: '${data!['posts']['data'][index]['message']}',
                  date: 'date$index',
                  onPress: () {
                    print('object $index');
                  });
            },
          );
        }
            // }else if(state is ErrorGetPostsState){
            // return Center(child: Text('error'));
            // }else{
// return Center(child: CircularProgressIndicator());
            // }
            ),
      ),
    );
  }
}
