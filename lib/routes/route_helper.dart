import 'package:food_delivery_app/pages/food/popular_food_details_page.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details_page.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';

  static String getPopularFood({required int pageId}) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetailsPage(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () => RecommendedFoodDetailsPage(),
        transition: Transition.fadeIn),
  ];
}