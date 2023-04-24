import 'dart:math';

import 'package:chat_bot/models/comments_model.dart';
import 'package:chat_bot/models/posts_model.dart';

class CollectionPostsModel {
  List<PostsModel> postsModel = [];
  // List<CommentsModel> commentsModel = [];

  CollectionPostsModel();

  // CollectionPostsModel({
  //   required this.postsModel,
  //   required this.commentsModel,
  // });

  factory CollectionPostsModel.fromJson(Map<String, dynamic> data) {
    CollectionPostsModel collectionPostsModel = CollectionPostsModel();
    for (var e in data['posts']['data']) {
      PostsModel temp = PostsModel.fromJson(e);
      collectionPostsModel.postsModel.add(temp);
    }

    // for (var element in data['comments']['data']) {
    //   CommentsModel temp = CommentsModel.fromJson(element);
    //   collectionPostsModel.commentsModel.add(temp);
    // }
    return collectionPostsModel;
    // return CollectionPostsModel(
    //   postsModel: data['posts']['data'],
    //   commentsModel: data['comments']['data'],
    // );
  }
}
