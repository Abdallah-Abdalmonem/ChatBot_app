import 'dart:convert';

import 'package:chatbot_app/models/posts_model.dart';
import 'package:chatbot_app/pages/comment_page/bloc_comment/comment_state.dart';
import 'package:chatbot_app/shared/network/local/lists.dart';
import 'package:chatbot_app/shared/network/remote/dio_helper.dart';
import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCubit extends Cubit<CommentState> {
  final accessToken = 'EAAJs0OWZCy6YBAMeA4rrL0petswgXObUncvgf4G89A4a9HijoDnEj91GL2ImmFazZCkm7Cps8Lj2BZC0ePruTtslGpXe9ZA5VNWVhIu3AKz3CkU1W4z7ORYSsp76bXcHESk0ykS4ddKGovDcocZCvBmFW6ggsU5eJ1i7vj7kIZBKNSwBR5o6ZBvKm7fEm2ZADCcF5ETY9up4NLACAKpqDIcL';

  CommentCubit() : super(InitialState());
  static CommentCubit get(context) => BlocProvider.of(context);

  Future<void> addComment() async {
    emit(LoadingAddCommentState());
    for (int i = 0; i < commentsId.length; i++) {
      Http.addCommentForComment(
              accessToken: accessToken,
              commentId: commentsId[i],
              message: 'عبدالله عبيط اوي اوي')
          .then((value) {
        // print(value);
        //print(value['posts']["data"][1]['comments']['data'][0]['id']);
        // print(postData);
        emit(SuccessAddCommentState());
      }).catchError((error) {
        emit(ErrorAddCommentState(error.toString()));
        print(error.toString());
      });
    }
  }

  Future getPosts() async {
    emit(LoadingGetPostsState());
    await Http.getposts(accessToken: accessToken).then((value) {
      // print(value);

      if (value['posts'] != null && value['posts']['data'] != null) {
        for (int i = 0; i < value['posts']['data'].length; i++) {
          postsId.add(value['posts']['data'][i]['id']);
          // print(postsId[i]);
        }
      }
      emit(SuccessGetPostsState());
      return value;
    }).catchError((error) {
      emit(ErrorGetPostsState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> getCommentId() async {
    emit(LoadingGetCommentState());
    await Http.getComment(accessToken: accessToken, postId: postsId[1])
        .then((value) {
      print(value);
      print('comment id!!!!!!!!!!!!!!!');
      if (value['data'] != null) {
        for (int i = 0; i < value['data'].length; i++) {
          commentsId.add(value['data'][i]['id']);
          print('comment id');
          print(commentsId[i]);
        }
      }

      emit(SuccessGetCommentState());
    }).catchError((error) {
      emit(ErrorGetCommentState(error.toString()));
      print(error.toString());
    });
  }
}
