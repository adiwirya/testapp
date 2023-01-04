import 'package:get/get.dart';

class HomeViewC extends GetxController {
  static HomeViewC get to => Get.find();

  RxString title = 'HomeView'.obs;
  RxInt count = 0.obs;

  void increment() => count.value++;
  void decrement() => count.value--;
}
