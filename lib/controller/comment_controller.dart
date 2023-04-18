import 'package:get/get.dart';

import '../core/constant/lists.dart';
import '../core/http_helper/http_helper.dart';

class getCommentController extends GetxController {
  var data= null.obs;
  Future getComment({required postId}) async {
    print('getCommentController @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

    Http.getComment(accessToken: accessToken, postId: postId)
        .then((value) async {
       data = await value;
       print('getCommentControllertwoooooo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print(data);
    });
    update();
     print('$data getCommentController threeeeeeeeee @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    return  data;
  }
}
