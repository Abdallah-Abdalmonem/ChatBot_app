import 'package:flutter/material.dart';

IconData icon = Icons.remove_red_eye;

Widget commentListItem(
        {required comment,
        name = '',
        required commentId,
        required bool isHidden,
        context}) =>
    Card(
      elevation: 7,
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 80,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                if (isHidden) {
                  isHidden = !isHidden;
                } else {
                  isHidden = !isHidden;
                }
              },
              icon: Icon(icon),
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
                          '''$comment''',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
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
