import 'package:chatbot_app/data/models/user_model.dart';
import 'package:chatbot_app/shared/constant/color.dart';
import 'package:chatbot_app/views/widgets/post_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  UserModel? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.buttonblue,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return itemPost(
                title: 'محمد بيه العبيط بيه $index',
                date: 'date$index',
                onPress: () {
                  print('object $index');
                });
          },
        ),
      ),
    );
  }
}
