import 'package:chatbot_app/data/models/user_model.dart';
import 'package:chatbot_app/shared/constant/color.dart';
import 'package:chatbot_app/shared/network/local/componant/navigate_to.dart';
import 'package:chatbot_app/views/screens/posts/cubit/posts_cubit.dart';
import 'package:chatbot_app/views/screens/posts/posts_screen.dart';
import 'package:chatbot_app/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  UserModel? _currentUser;
  var data = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.buttonblue,
      body: SafeArea(
        child: BlocListener<PostsCubit, PostsState>(
          listener: (context, state) async {
            await BlocProvider.of<PostsCubit>(context).getPost();
          },
          child: Center(
              child: TextButton(
            child: Text('Home Screen'),
            onPressed: () async {
              // await BlocProvider.of<PostsCubit>(context).getPost();
              if (data == null) {
                data = BlocProvider.of<PostsCubit>(context).getPost();
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostsScreen(),
                  ));
            },
          )),
        ),
      ),
    );
  }
}
