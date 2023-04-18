import 'package:chat_bot/core/constant/app_routes.dart';
import 'package:chat_bot/core/constant/app_theme.dart';
import 'package:chat_bot/core/constant/color.dart';
import 'package:chat_bot/core/constant/image_assets.dart';
import 'package:chat_bot/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  AppImageAsset.bot_Image_White,
                  width: 100,
                  height: 100,
                ),
                Text(
                  'chat bot\nfacebook',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 50,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'حان الوقت لتكون قريبا من عملائك على\n الدوام\n اهلا وسهلا بكم في \n Chat bot facebook',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'اداره الصفحه والرد على منشورات•',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            textTitle(
                title:
                    ' والتعليقات والرسائل الصفحه فى \n اداره الصفحه والرد على منشورات  •'),
            const SizedBox(
              height: 10,
            ),
            textTitle(
              title: ' اداره الصفحات الفيسبوك•',
            ),
            const SizedBox(
              height: 10,
            ),
            textTitle(
              title: ' اداره الصفحات الفيسبوك•',
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.login);
                },
                child: const Text('أبدا الان'))
          ],
        )),
      ),
    );
  }
}

class textTitle extends StatelessWidget {
  String? title;
  textTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text('$title',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900));
  }
}
