import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_details_page.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details_page.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood({required int pageId, required String pageName}) => '$popularFood?pageId=$pageId&pageName=$pageName';
  static String getRecommendedFood({required int pageId, required String pageName}) => '$recommendedFood?pageId=$pageId&pageName=$pageName';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];
          return PopularFoodDetailsPage(pageId: int.parse(pageId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];
          return RecommendedFoodDetailsPage(pageId: int.parse(pageId!), pageName: pageName! );
        },
        transition: Transition.fadeIn),

    GetPage(name: cartPage, page: () => CartPage(), transition: Transition.fadeIn),
  ];
}
