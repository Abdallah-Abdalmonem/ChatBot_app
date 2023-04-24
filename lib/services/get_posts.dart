import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/models/collection_post_model.dart';
import 'package:chat_bot/models/posts_model.dart';
import 'package:chat_bot/models/test.dart';
import '../core/helper/api.dart';

class GetPostsService {
  Future getPosts({required String accessToken}) async {
    List<test> postsList = [];

    var data = await Api().getPosts(accessToken: accessToken);

    print('********************\n data = ${data}');

    for (var e in data) {
      postsList.add(test.fromJson(e));
    }

    print('********************\n posts = ${postsList}');

    return postsList;
  }
}
