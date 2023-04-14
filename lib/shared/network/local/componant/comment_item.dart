import 'package:chatbot_app/pages/comment_page/bloc_comment/comment_cubit.dart';
import 'package:flutter/material.dart';

IconData icon = Icons.remove_red_eye;

Widget commentListItem(
        {required comment,
        required name,
        required commentId,
        required isShow,
        context}) =>
    InkWell(
      onTap: () {
        // navigateto(context: context, wiget: Webview(url: list['url'], ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 80,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  
                  if (isShow) {
                    isShow = !isShow;
                    icon = Icons.remove_red_eye;
                  } else {
                    icon = Icons.lock;
                    isShow = !isShow;
                  }
                  CommentCubit.get(context).hidenComment(commentId: commentId);
                },
                icon: Icon(icon)),
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
                          '''$comment''',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      );
                    }),
                  ),
                  Center(
                    child: Text(
                      '''$name''',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
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
