import 'package:get/get.dart';

import '../core/constant/lists.dart';
import '../core/http_helper/http_helper.dart';

class getCommentController extends GetxController {
  Map<String, dynamic> data = {};

  Future getComment({required postId}) async {
    Http.getComment(accessToken: accessToken, postId: postId)
        .then((value) async {
      data = await value;
      update();
      return await data;
    }).catchError((error) {
      print('erorrrrr!!!!!!!! ${error.toString()}');
    });
    update();
  }
}
