import 'package:chatbot_app/pages/post_page/bloc_post/posts_state.dart';

import 'package:chatbot_app/shared/constant/values.dart';

import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  
  PostCubit() : super(InitialState());
  static PostCubit get(context) => BlocProvider.of(context);

  var data;
  Future getPost() async {
    emit(LoadingGetPostsState());
    await Http.getposts(accessToken: accessToken).then((value) async {
      // print(value);

      if (value['posts'] != null && value['posts']['data'] != null) {
        for (int i = 0; i < value['posts']['data'].length; i++) {
          postsId.add(value['posts']['data'][i]['id']);
          // print(postsId[i]);
        }
      }
      emit(SuccessGetPostsState());
      // print(value);
      data = await value;
    }).catchError((error) {
      emit(ErrorGetPostsState(error.toString()));
      print(error.toString());
    });
    return await data;
  }
}
