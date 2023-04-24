import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/core/http_helper/http_helper.dart';
import 'package:chat_bot/models/posts_model.dart';
import '../core/helper/api.dart';

class GetPostsService {
  List<Data> postsList = [];
  List<String?> postsIdList = [];
  List<Data1> commentsList = [];

  Future getPosts({required String accessToken}) async {
    Map<String, dynamic> data = await Api().getPosts(accessToken: accessToken);

    List<Data>? postsData = await PostsModel.fromJson(data).posts!.data;
    for (var element in postsData!) {
      postsList.add(element);
      postsIdList.add(element.id);
    }

    return postsList;
  }

  Future getComments({required String accessToken}) async {
    Http.getComment(
        accessToken: accessToken1, postId: postsIdList[0].toString());

    // for (var element in commentsData!) {
    //   commentsList.add(element);
    // }

    return commentsList;
  }
}
