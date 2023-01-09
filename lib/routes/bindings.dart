import 'package:get/get.dart';
import 'package:testapp/getx/getxs.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewC>(HomeViewC.new);
  }
}

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostC>(PostC.new);
  }
}
