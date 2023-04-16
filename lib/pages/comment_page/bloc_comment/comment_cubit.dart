import 'package:chatbot_app/pages/comment_page/bloc_comment/comment_state.dart';
import 'package:chatbot_app/shared/constant/values.dart';
import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCubit extends Cubit<CommentState> {
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

  var data;
  Future getComments({required postId}) async {
    emit(LoadingGetCommentState());
    await Http.getComment(accessToken: accessToken, postId: postId)
        .then((value) async {
      // print(value);
      print('comment id!!!!!!!!!!!!!!!');
      // if (value['comments']['data'] != null) {
      //   for (int i = 0; i < value['comments']['data'].length; i++) {
      //     commentsId.add(value['comments']['data'][i]['id']);
      //     print('comment id');
      //     print(commentsId[i]);
      //   }
      // }
      data = await value;
      emit(SuccessGetCommentState());
    }).catchError((error) {
      emit(ErrorGetCommentState(error.toString()));
      print(error.toString());
    });
    return data;
  }

  Future<void> hidenComment(
      {required commentId, required bool isHidden}) async {
    emit(LoadingHideCommentState());
    await Http.hideComment(
            accessToken: accessToken, is_hidden: isHidden, commentId: commentId)
        .then((value) {
      print(value);
      print('comment is hiden now!!!!!!!!!!!!!!!');
  
      emit(SuccessHideCommentState());
    }).catchError((error) {
      emit(ErrorHideCommentState(error.toString()));
      print(error.toString());
    });
  }

  IconData icon= Icons.remove_red_eye;
  
  iconChange({required bool is_hidden}) async {
    if (is_hidden) {
      emit(CommentIconNotHidenState());
     return  icon =Icons.remove_red_eye;
      
    } else {
      emit(CommentIconHidenState());
      return  icon = Icons.lock;
      
    }
  }
}
