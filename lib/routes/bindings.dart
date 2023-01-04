import 'package:get/get.dart';
import 'package:testapp/getx/getxs.dart';
import 'package:testapp/getx/recipe.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewC>(HomeViewC.new);
  }
}

class JsonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonC>(JsonC.new);
  }
}

class RecipeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeC>(RecipeC.new);
  }
}
