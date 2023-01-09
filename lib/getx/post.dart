import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:testapp/model/models.dart';
import 'package:testapp/routes/app_routes.dart';
import 'package:testapp/service/post_service.dart';

class PostC extends GetxController {
  static PostC get to => Get.find();

  RxList<Post> items = <Post>[].obs;
  ApiClient apiClient = ApiClient(dio.Dio());

 Future<void> getPostData() async {
    final data = await apiClient.getPosts();
    log(data.toString());
  }
}
