import 'package:food_delivery_app/controllers/popular_food_products_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // first put the Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'url'));
//  Then put the Repositories
  Get.lazyPut(() => PopularFoodProductItemRepo(apiClient: Get.find()));
// Then put the Controllers
  Get.lazyPut(() => PopularFoodProductsController(popularFoodProductItemRepo: Get.find()));
}