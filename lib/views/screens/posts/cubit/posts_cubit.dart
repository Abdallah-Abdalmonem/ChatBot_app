import 'package:bloc/bloc.dart';
import 'package:chatbot_app/pages/post_page/bloc_post/posts_state.dart';
import 'package:chatbot_app/shared/network/local/lists.dart';
import 'package:chatbot_app/shared/network/remote/http_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);
  Map<String, dynamic>? data = null;

  Future getPost() async {
    emit(LoadingGetPostsState());
    await Http.getposts(accessToken: accessToken).then((value) async {
      // print(value);

      // if (value['posts'] != null && value['posts']['data'] != null) {
      // for (int i = 0; i < value['posts']['data'].length; i++) {
      // for (int i = 0; i < 5; i++) {
      // postsId.add(value['posts']['data'][i]['id']);
      // print(postsId[i]);
      // }
      // }
      data = await value;
      emit(SuccessGetPostsState(posts: value));
      // print(value);
      // data = await value;
    }).catchError((error) {
      emit(ErrorGetPostsState(error.toString()));
      print(error.toString());
    });

    return await data;
  }
}
