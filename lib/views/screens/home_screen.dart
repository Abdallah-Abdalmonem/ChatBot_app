import 'package:chat_bot/controller/login_facebook_Controller.dart';
import 'package:chat_bot/core/constant/app_routes.dart';
import 'package:chat_bot/core/constant/color.dart';
import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/core/helper/api.dart';
import 'package:chat_bot/models/user_model.dart';
import 'package:chat_bot/services/get_posts.dart';
import 'package:chat_bot/views/screens/posts_screen.dart';
import 'package:chat_bot/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../controller/get_posts_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.find();
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.buttonblue,
        elevation: 3,
        title: const Text("home screen"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                controller.logOut();
              }),
        ],
      ),
      body: Center(
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => Column(
            children: [
              Spacer(),
              Text(
                'Hello ${controller.userProfile['first_name']}',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    '${controller.userProfile['picture']['data']['url']}',
                    fit: BoxFit.cover,
                    height: 140,
                    width: 140,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text('${controller.userProfile['name']}'),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       controller.ref();
              //     },
              // child: const Text('data')),
              CustomButtonOnBoarding(
                onPress: () {
                  Get.offNamed(AppRoutes.posts);
                },
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
