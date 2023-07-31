import 'package:food_delivery_app/controllers/popular_food_products_controller.dart';
import 'package:food_delivery_app/controllers/recommended_food_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:food_delivery_app/data/repositories/recommended_food_product_item_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // first put the Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URI));
//  Then put the Repositories
  Get.lazyPut(() => PopularFoodProductItemRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodProductItemRepo(apiClient: Get.find()));
// Then put the Controllers
  Get.lazyPut(() =>
      PopularFoodProductsController(popularFoodProductItemRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodProductsController(
      recommendedFoodProductItemRepo: Get.find()));
}
