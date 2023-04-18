import 'package:get/get.dart';

import '../core/constant/lists.dart';
import '../core/http_helper/http_helper.dart';

class getCommentController extends GetxController {
  var data;
  getComment({required postId}) {
    Http.getComment(accessToken: accessToken, postId: postId)
        .then((value) async {
      data = await value;
    });
    return data;
  }
}
