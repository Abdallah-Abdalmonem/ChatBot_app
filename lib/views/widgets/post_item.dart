import 'package:flutter/material.dart';

import '../../shared/constant/color.dart';

class itemPost extends StatelessWidget {
  String title;
  String date;
  void Function()? onPress;

  itemPost({
    super.key,
    required this.title,
    required this.date,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.itemPost,
      ),
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(4),
      child: ListTile(
        iconColor: AppColor.iconColor,
        // tileColor: AppColor.black,
        horizontalTitleGap: 8,
        textColor: AppColor.textTitleColor,
        title: Text(
          'Post:\t\t$title',
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        subtitle: Text(
          'Data:\t$date',
          style: TextStyle(
            color: AppColor.textSubtitleColor,
            letterSpacing: 4,
          ),
        ),
        minVerticalPadding: 6,
        contentPadding: const EdgeInsets.only(left: 20, right: 15, top: 10),
        trailing: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.arrow_forward_ios_outlined)),
      ),
    );
  }
}
