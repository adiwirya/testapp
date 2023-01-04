import 'package:get/get.dart';
import 'package:testapp/routes/app_routes.dart';
import 'package:testapp/routes/bindings.dart';
import 'package:testapp/view/views.dart';

class AppPages {
  static const initial = Routes.homeScreen;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.jsonScreen,
      page: () => const JsonScreen(),
      binding: JsonBinding(),
    ),
    GetPage(
      name: Routes.recipeScreen,
      page: () => const RecipeScreen(),
      binding: RecipeBinding(),
    ),
  ];
}
