import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testapp/model/models.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
    );

    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('posts/')
  Future<List<Post>> getPosts();
}
