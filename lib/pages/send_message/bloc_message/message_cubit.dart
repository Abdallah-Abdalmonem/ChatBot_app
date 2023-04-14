
import 'package:chatbot_app/pages/send_message/bloc_message/message_state.dart';

import 'package:chatbot_app/shared/network/local/lists.dart';

import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageState> {
 
  MessageCubit() : super(InitialState());
  static MessageCubit get(context) => BlocProvider.of(context);

  var data;
  Future getUserIds() async {
    emit(LoadingGetIdsState());
    await Http.createPost(pageId: pageId ,message: 'function of create posts',accessToken: accessToken).then((value) async {
      // print(value);

      
      emit(SuccessGetIdsState());
      // print(value);
     
    }).catchError((error) {
      emit(ErrorGetIdState(error.toString()));
      print(error.toString());
    });
    
  }

    Future creatPostWithImage({required imagePath }) async {
    emit(LoadingGetIdsState());
    await Http.createPostWithImage(
            pageId: pageId,
            message: 'function of create posts',
            accessToken: accessToken,
            imagePath: imagePath,
             )
        .then((value) async {
      // print(value);

      emit(SuccessGetIdsState());
      // print(value);
    }).catchError((error) {
      emit(ErrorGetIdState(error.toString()));
      print(error.toString());
    });
  }
}
