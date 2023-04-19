import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/models/posts_model.dart';
import '../core/helper/api.dart';

class GetPostsService {
  List postsList = [];
  List commentsList = [];

  Future getPosts({required String accessToken}) async {
    Map<String, dynamic> data = await Api().get(accessToken: accessToken);

    List<dynamic> postsList = [];

    print(
        '******************************************\n${data['posts']['data'][0]['message']}');

    for (int i = 0; i < data['posts']['data'].length; i++) {
      postsList.add(data['posts']['data'][i]);
    }
    // print(postsList);
    return postsList;
  }
}
