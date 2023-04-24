import 'package:chat_bot/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/cutom_text_field.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: Custombuttomsheet,
              child: const Text('انشاء بوست'),
            ),
          ],
        ),
      ),
    );
  }

  Custombuttomsheet() {
    return Get.bottomSheet(
      isDismissible: false,
      backgroundColor: AppColor.white,
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'نشر البوست',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customTextFiled(
                hintText: 'كتابة بوست',
                //controller
                textController: TextEditingController(),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('نشر'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
