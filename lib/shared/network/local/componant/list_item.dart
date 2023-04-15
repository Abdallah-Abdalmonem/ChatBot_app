import 'package:chatbot_app/pages/comment_page/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_app/shared/network/local/componant/navigate_to.dart';

Widget listItem(
        {required image,
        required title,
        required date,
        required postId,
        context}) =>
    InkWell(
      onTap: () {
        navigateTo(
          context: context,
          wiget: CommentScreen(postId: postId),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 120,
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image(
                image: NetworkImage(
                  '''${image??'https://th.bing.com/th/id/R.ebe12dc32db7d3a0089ce0f1c5b0caea?rik=gatB2Ut7aWOLtg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-EzeswpQ0o7M%2fURusTcu183I%2fAAAAAAAAACQ%2fU6b9mbyvO-4%2fs1600%2ffacebook%2blogo%2b7.jpg&ehk=d8y3tYTW51sJk69QOxaCsmrcJdamfbydV0WUyIMk7EM%3d&risl=&pid=ImgRaw&r=0'}''',
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Builder(builder: (context) {
                      return Center(
                        child: Text(
                          '''$title''',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      );
                    }),
                  ),
                  Center(
                    child: Text(
                      '''$date''',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
