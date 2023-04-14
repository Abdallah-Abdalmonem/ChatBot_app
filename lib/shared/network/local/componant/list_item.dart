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
                  '''${image}''',
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
