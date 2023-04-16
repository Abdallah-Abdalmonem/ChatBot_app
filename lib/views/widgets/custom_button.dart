import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  CustomButtonOnBoarding({super.key, required this.onPress});

  void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => AppColor.primaryColor)),
      onPressed: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: Text(
          'اظهار البوستات',
          style: TextStyle(color: AppColor.white, fontSize: 20),
        ),
      ),
    );
  }
}
