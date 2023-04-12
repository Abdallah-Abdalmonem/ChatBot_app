import 'dart:convert';

import 'package:chatbot_app/pages/comment_page/bloc_comment/comment_state.dart';
import 'package:chatbot_app/shared/network/remote/dio_helper.dart';
import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCubit extends Cubit<CommentState> {
  final accessToken =
        'EAAJs0OWZCy6YBABV89KjIoGuyQiFHu1rRPUNU8RFl2trtrfNqbzqqvT2IBHYpqTEkZBUsRniA6Y860qFC8kMqu1eyT3XcD6tqaXOwy0dNDC5pC07zPqZBSYJLUrm6iAZAHK7yyJBFoL52wJESSDFMnpI5ZBpuLxtVi3PHO5bblZCnHDnSZB2zgIB3UqrQYqePTnhoHPzg5WQY3IkT0BaMjb';
  
    CommentCubit() : super(InitialState());
  static CommentCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> decodedData = {};
  //  List<dynamic>  postData = [];
  void getPostsAndcomment() {
    emit(LoadingGetCommentState());
    Http.getNumComment(
            accessToken: accessToken, postId: '113400945051600_114854861572261')
        .then((value) {
      print(value);
      //print(value['posts']["data"][1]['comments']['data'][0]['id']);
      // print(postData);
      emit(SuccessGetCommentState());
    }).catchError((error) {
      emit(ErrorGetCommentState(error.toString()));
      print(error.toString());
    });
  }
}
