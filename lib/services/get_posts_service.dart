import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/models/posts_model.dart';
import '../core/helper/api.dart';

class GetPostsService {
  List<Data> postsList = [];

  Future getPosts({required String accessToken}) async {
    Map<String, dynamic> data = await Api().getPosts(accessToken: accessToken);

    // print('******************** data = ${data}');

    List<Data>? postsData = await PostsModel.fromJson(data).posts!.data;
    for (var element in postsData!) {
      postsList.add(element);
    }

    // for (var e in data) {
    //   postsList.add(PostsModel.fromJson(e));
    // }

    // print('********************\n posts = ${postsList}');

    return postsList;
  }
}
